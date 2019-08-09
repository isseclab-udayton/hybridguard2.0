function Weather() 
{	

	var t = new Translation();

	this.show = function()
	{

    	$.getJSON("http://visitingbruges.com/en/index.php/api/weersverwachting",
        function(data){
        	
        	
        	var today = data.today; 
        	today = parseInt(today);
        	
        	var forecast = new Object();
        	var i = 0;
        	$.each(data, function(key, val)
        	{

        		if(key != "today")
        		{
        			
        			var code = parseInt(val.icon);
        			key = parseInt(key);
        			
	        		var day = new Object();
	        		day.weekday = getDayFromCode(key);
	        		day.max = val.maximum;
	        		day.min = val.minimum;
	        		day.weather = getWeatherFromCode(code);
	        		forecast[key] = day;
	        		
        		}
        		
        	})
        	
        	
        	// sort array
        	
        	var before = [];
        	var week = [];
        	
        	for(var i = 1; i < 7; i++)
        	{
        		if(i < today)
        		{
        			before.push(forecast[i]);
        		}
        		else
        		{
        			week.push(forecast[i]);
        		}
        	}

        	$.merge(week, before);

        	$(".weather_temp").text(week[0].max + "°C");

        	switch(week[0].weather)
        	{
        		
        		case "cloudy":
        			$(".weather_image").addClass("cloudy");
        		break;
        		case "foggy":
        			$(".weather_image").addClass("foggy");
        		break;
        		case "heavyrain":
        			$(".weather_image").addClass("heavyrain");
        		break;
        		case "littlerain":
        			$(".weather_image").addClass("littlerain");
        		break;
        		case "nightcloudy":
        			$(".weather_image").addClass("nightcloudy");
        		break;
        		case "night":
        			$(".weather_image").addClass("night");
        		break;
        		case "partlycloudy":
        			$(".weather_image").addClass("partlycloudy");
        		break;
        		case "rainy":
        			$(".weather_image").addClass("rainy");
        		break;
        		case "snowy":
        			$(".weather_image").addClass("snowy");
        		break;
        		case "sunshine":
        			$(".weather_image").addClass("sunshine");
        		break;
        		case "thunder":
        			$(".weather_image").addClass("thunder");
        		break;
        		case "windy":
        			$(".weather_image").addClass("windy");
        		break;
        		
        	}
        	
        	switch(week[1].weather)
        	{
        		
        		case "cloudy":
        			$(".tomorrow_thumb").addClass("cloudy");
        		break;
        		case "foggy":
        			$(".tomorrow_thumb").addClass("foggy");
        		break;
        		case "heavyrain":
        			$(".tomorrow_thumb").addClass("heavyrain");
        		break;
        		case "littlerain":
        			$(".tomorrow_thumb").addClass("littlerain");
        		break;
        		case "nightcloudy":
        			$(".tomorrow_thumb").addClass("nightcloudy");
        		break;
        		case "night":
        			$(".tomorrow_thumb").addClass("night");
        		break;
        		case "partlycloudy":
        			$(".tomorrow_thumb").addClass("partlycloudy");
        		break;
        		case "rainy":
        			$(".tomorrow_thumb").addClass("rainy");
        		break;
        		case "snowy":
        			$(".tomorrow_thumb").addClass("snowy");
        		break;
        		case "sunshine":
        			$(".tomorrow_thumb").addClass("sunshine");
        		break;
        		case "thunder":
        			$(".tomorrow_thumb").addClass("thunder");
        		break;
        		case "windy":
        			$(".tomorrow_thumb").addClass("windy");
        		break;
        		
        	}
        	
        	$(".tomorrow_name").empty().append(t.translate("morgen"));
        	$(".tomorrow_temp").empty().append(week[1].max + " °C");	
          
        });

	}
	
	function getWeatherFromCode(code)
	{
		$c = code;
		
    	// CLOUDY
    	if($c == 25 || $c == 26 || $c == 28 || $c == 27)
    	{
    		return "cloudy";
    	}
    	
    	// FOGGY
    	if($c == 19 || $c == 20 || $c == 21 || $c == 22 || $c == 23)
    	{
    		return "foggy";
    	}
    	
    	// HEAVY RAIN
    	if($c == 12 || $c == 35 || $c == 40)
    	{
    		return "heavyrain";
    	}
    	
    	// LITTLE RAIN
    	if($c == 11 || $c == 8 || $c == 9)
    	{
    		return "littlerain";
    	}
    	
    	// NIGHT
    	if($c == 31 || $c == 33)
    	{
    		return "night";
    	}
    	
    	// PARTLY CLOUDY
        if($c == 30 || $c == 44 || $c == 29)
		{
			return "partlycloudy";
		}
		
		// RAINY
		if($c == 6 || $c == 10)
		{
			return "rainy";
		}
		
		// SNOWY
		if($c == 5 || $c == 7 || $c == 13 || $c == 14 || $c == 15 || $c == 16 || $c == 41 || $c == 42 || $c == 43 || $c == 46)
		{
			return "snowy";
		}
		
		// SUNSHINE
		if($c == 32 || $c == 34 || $c == 36)
		{
			return "sunshine";
		}
		
		// THUNDER
		if($c == 3 || $c == 4 || $c == 37 || $c == 38 || $c == 39 || $c == 45 || $c == 47)
		{
			return "thunder";
		}
		
		// WINDY
		if($c == 0 || $c == 1 || $c == 3 || $c == 24)
		{
			return "windy";
		}
		
	}
	
	function getDayFromCode(code)
	{
		switch(code)
		{
			case 1: return "monday"; break;
			case 2: return "tuesday"; break;
			case 3: return "wednesday"; break;
			case 4: return "thursday"; break;
			case 5: return "friday"; break;
			case 6: return "saturday"; break;
			case 7: return "sunday"; break;
		}
	}
	
}


	
