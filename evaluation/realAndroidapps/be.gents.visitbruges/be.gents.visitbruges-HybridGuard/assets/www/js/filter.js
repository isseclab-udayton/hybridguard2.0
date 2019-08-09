function Filter()
{
	
	var lang = window.localStorage.getItem("lang");
	var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 1000000);
	
	this.loadCategories = function(callback)
	{

		db.transaction(function(tx)
		{
			tx.executeSql('SELECT * FROM CATEGORIES', [], function(tx, results)
			{
				
				if(results.rows.length < 1)
	    		{
	    			// no data stored yet
	    			navigator.notification.alert(
					    t.translate("error"),  				// message
					    alertDismissed,         			// callback
					    '',             					// title
					    t.translate("ok")                  	// buttonName
					);
					
	    		}
	    		else
	    		{
	    			
	    			var categories = "";
	    			var count = results.rows.length;
	    			
	    			for (var i=0; i<results.rows.length; i++)
    				{
    				
    					var title = "";
    					
    					switch(lang)
    					{
    						case 'nl': title = results.rows.item(i).title_nl; break;
    						case 'en': title = results.rows.item(i).title_en; break;
    						case 'fr': title = results.rows.item(i).title_fr; break;
    						case 'de': title = results.rows.item(i).title_de; break;
    						case 'es': title = results.rows.item(i).title_es; break;
    					}
    					
    					var colorClass = "";
    					var color = "";
    					
    					switch(results.rows.item(i).id)
    					{
    						case 1: // visit arts & heritage
    							colorClass = "cat_purple";
    							color = window.localStorage.getItem("purple");
    						break;
    						case 2: // visit culture
    							colorClass = "cat_blue";
    							color = window.localStorage.getItem("blue");
    						break;
    						case 3: // visit hotels
    							colorClass = "cat_cyan";
    							color = window.localStorage.getItem("cyan");
    						break;
    						case 4: // visit food
    							colorClass = "cat_orange";
    							color = window.localStorage.getItem("orange");
    						break;
    						case 5: // visit outdoors
    							colorClass = "cat_green";
    							color = window.localStorage.getItem("green");
    						break;
    						case 20: // visit romance
    							colorClass = "cat_pink";
    							color = window.localStorage.getItem("pink");
    						break;
    						
    					}

    					
    					var li = '<div itemcolor="' + color + '" class="cat button" slug="' + results.rows.item(i).slug + '" cat_id="' + results.rows.item(i).id + '"><span class="' + colorClass + '">' + title + '</span></div>';

    					categories = categories + li;

    				}
    				
    				callback(categories);

	    		}
				
			}, errorCB);
			
		}, errorCB);
		
		
	}
	
	
	this.loadSubItems = function(cat_id, callback)
	{
		
		var allItems = "";
	
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT * FROM SUBCATEGORIES WHERE cat_id = ' + cat_id, [], function(tx, results)
			{
				
				if(results.rows.length < 1)
	    		{
	    			// nothing found
	    		}
	    		else
	    		{
	    			
	    			var subcategories = "";
	    			
	    			for (var i=0; i<results.rows.length; i++)
    				{
    				
    					var title = "";
    					
    					switch(lang)
    					{
    						case 'nl': title = results.rows.item(i).title_nl; break;
    						case 'en': title = results.rows.item(i).title_en; break;
    						case 'fr': title = results.rows.item(i).title_fr; break;
    						case 'de': title = results.rows.item(i).title_de; break;
    						case 'es': title = results.rows.item(i).title_es; break;
    					}
    					
    					var colorClass = "";
    					
    					cat_id = parseInt(cat_id);
    					
    					switch(cat_id)
    					{
    						case 1: // visit arts & heritage
    							colorClass = "cat_purple";
    						break;
    						case 2: // visit culture
    							colorClass = "cat_blue";
    						break;
    						case 3: // visit hotels
    							colorClass = "cat_cyan";
    						break;
    						case 4: // visit food
    							colorClass = "cat_orange";
    						break;
    						case 5: // visit outdoors
    							colorClass = "cat_green";
    						break;
    						case 20: // visit romance
    							colorClass = "cat_pink";
    						break;
    						
    					}
    			

						if(results.rows.item(i).hidden == "n")
						{ 
							var li = '<div from="home" type="page_sub" class="sub button" topcat="' + cat_id + '" slug="' + results.rows.item(i).slug + '" id="' + results.rows.item(i).id + '"><span class="' + colorClass + '">' + title + '</span></div>';
	    					subcategories = subcategories + li;
						}

    					

    				}
    				
    				callback(subcategories);

	    		}
				
			}, errorCB);
			
		}, errorCB);
		
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT * FROM PAGES WHERE cat_id = ' + cat_id, [], function(tx, results)
			{
				
				if(results.rows.length < 1)
	    		{
	    			// nothing found
	    		}
	    		else
	    		{
	    			
	    			var pages = "";
	    			
	    			for (var i=0; i<results.rows.length; i++)
    				{
    				
    					var title = "";
    					
    					switch(lang)
    					{
    						case 'nl': title = results.rows.item(i).title_nl; break;
    						case 'en': title = results.rows.item(i).title_en; break;
    						case 'fr': title = results.rows.item(i).title_fr; break;
    						case 'de': title = results.rows.item(i).title_de; break;
    						case 'es': title = results.rows.item(i).title_es; break;
    					}
    					
    					var colorClass = "";
    					
    					switch(cat_id)
    					{
    						case 1: // visit arts & heritage
    							colorClass = "cat_purple";
    						break;
    						case 2: // visit culture
    							colorClass = "cat_blue";
    						break;
    						case 3: // visit hotels
    							colorClass = "cat_cyan";
    						break;
    						case 4: // visit food
    							colorClass = "cat_orange";
    						break;
    						case 5: // visit outdoors
    							colorClass = "cat_green";
    						break;
    						case 20: // visit romance
    							colorClass = "cat_pink";
    						break;
    						
    					}

    					var li = '<div from="home" type="page_page" class="sub button" topcat="' + cat_id + '" slug="' + results.rows.item(i).slug + '" id="' + results.rows.item(i).id + '"><span class="' + colorClass + '">' + title + '</span></div>';

    					pages = pages + li;

    				}
    				
    				callback(pages);

	    		}
				
			}, errorCB);
			
		}, errorCB);
		
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT id, title_nl, title_en, title_fr, title_de, title_es FROM LOCATIONS WHERE stick_to = ' + cat_id, [], function(tx, results)
			{
				
				if(results.rows.length < 1)
	    		{
	    			// nothing found
	    		}
	    		else
	    		{
	    			
	    			var locations = "";
	    			
	    			for (var i=0; i<results.rows.length; i++)
    				{
    			
    					var title = "";
    					
    					switch(lang)
    					{
    						case 'nl': title = results.rows.item(i).title_nl; break;
    						case 'en': title = results.rows.item(i).title_en; break;
    						case 'fr': title = results.rows.item(i).title_fr; break;
    						case 'de': title = results.rows.item(i).title_de; break;
    						case 'es': title = results.rows.item(i).title_es; break;
    					}
    					
    					var colorClass = "";
    					
    					switch(cat_id)
    					{
    						case 1: // visit arts & heritage
    							colorClass = "cat_purple";
    						break;
    						case 2: // visit culture
    							colorClass = "cat_blue";
    						break;
    						case 3: // visit hotels
    							colorClass = "cat_cyan";
    						break;
    						case 4: // visit food
    							colorClass = "cat_orange";
    						break;
    						case 5: // visit outdoors
    							colorClass = "cat_green";
    						break;
    						case 20: // visit romance
    							colorClass = "cat_pink";
    						break;
    						
    					}

    					var li = '<div from="home" type="page_location" class="sub button" topcat="' + cat_id + '" slug="' + results.rows.item(i).slug + '" id="' + results.rows.item(i).id + '"><span class="' + colorClass + '">' + title + '</span></div>';

    					locations = locations + li;

    				}
    				
    				callback(locations);

	    		}
				
			}, errorCB);
			
		}, errorCB);

		
	}
	

	
	function errorCB(error)
	{
		console.log("filter.js - " + error.code);
	}
	
}

