function DataHandler()
{
	var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 1000000);

	this.checkData = function(callback)
	{
		
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT * FROM SETTINGS WHERE key = "version"', [], function(tx, results)
			{

				if(results.rows.length < 1)
	    		{
	    			callback(false);
	    		}
	    		else
	    		{
	    			
	    			var versionnumber = results.rows.item(0).value;
	    			
	    			$.getJSON("API/api.json", function(data) 
	  				{
	  					
	    				//callback(true);
	    				$.each(data.version, function(key, val)
		    			{
		    				
	    					if(versionnumber == val)
	    					{
	    						callback(true);
	    					}
	    					else
	    					{
	    						callback(false);
	    					}
	    					
		    			})
		    			
	    			})
	    			
	    		}
				
			}, function(){
				
				navigator.notification.alert(
				    t.translate("error"),  	// message
				    alertDismissed,         			// callback
				    ' ',             					// title
				    t.translate("ok")                  	// buttonName
				);
				
			});
			
		}, function(){
			
			navigator.notification.alert(
			    t.translate("error"),  	// message
			    alertDismissed,         			// callback
			    ' ',             					// title
			    t.translate("ok")                  	// buttonName
			);
			
		});
		
	}

	
	this.storeData = function(callback)
	{

		$.getJSON("API/api.json", function(data) 
	  	{
	
			db.transaction(function(tx)
			{
				
				tx.executeSql('CREATE TABLE IF NOT EXISTS SETTINGS (key UNIQUE, value)');
				
				tx.executeSql('DROP TABLE IF EXISTS CATEGORIES');
				tx.executeSql('CREATE TABLE IF NOT EXISTS CATEGORIES (id INTEGER PRIMARY KEY UNIQUE, slug TEXT UNIQUE, title_nl TEXT, title_en TEXT, title_fr TEXT, title_de TEXT, title_es TEXT)');
				
				tx.executeSql('DROP TABLE IF EXISTS SUBCATEGORIES');
				tx.executeSql('CREATE TABLE IF NOT EXISTS SUBCATEGORIES (id INTEGER PRIMARY KEY UNIQUE, cat_id INTEGER, slug TEXT UNIQUE, title_nl TEXT, title_en TEXT, title_fr TEXT, title_de TEXT, title_es TEXT, hidden TEXT)');
				
				tx.executeSql('DROP TABLE IF EXISTS LOCATIONS');
				tx.executeSql('CREATE TABLE IF NOT EXISTS LOCATIONS (id INTEGER PRIMARY KEY UNIQUE, cat_id INTEGER, subcat_id INTEGER, stick_to INTEGER, slug TEXT UNIQUE, title_nl TEXT, title_en TEXT, title_fr TEXT, title_de TEXT, title_es TEXT, location_lat TEXT, location_lng TEXT, adress_street TEXT, adress_city TEXT, adress_postal TEXT, adress_country TEXT, adress_countrycode TEXT, adress_gmaps TEXT, adress_bing TEXT, adress_mapquest TEXT, adress_places TEXT, summary_nl TEXT, summary_en TEXT, summary_fr TEXT, summary_de TEXT, summary_es TEXT, description_nl TEXT, description_en TEXT, description_fr TEXT, description_de TEXT, description_es TEXT, email TEXT, telefoon TEXT, website_nl TEXT, website_en TEXT, website_fr TEXT, website_de TEXT, website_es TEXT, price_nl TEXT, price_en TEXT, price_fr TEXT, price_de TEXT, price_es TEXT, bcc_formula TEXT, bcc_nl TEXT, bcc_en TEXT,bcc_fr TEXT,bcc_de TEXT,bcc_es TEXT,monday TEXT,tuesday TEXT,wednesday TEXT,thursday TEXT,friday TEXT,saturday TEXT,sunday TEXT,closed_nl TEXT, closed_en TEXT, closed_fr TEXT, closed_de TEXT, closed_es TEXT, type TEXT, hotel_stars TEXT, hotelcond_nl TEXT, hotelcond_en TEXT, hotelcond_fr TEXT, hotelcond_de TEXT, hotelcond_es TEXT, restaurant_stars TEXT, restaurant_chef TEXT, images TEXT, wishlist TEXT, open_nl TEXT, open_en TEXT, open_fr TEXT, open_de TEXT, open_es TEXT)');
	
				tx.executeSql('DROP TABLE IF EXISTS PAGES');
				tx.executeSql('CREATE TABLE IF NOT EXISTS PAGES (id INTEGER PRIMARY KEY UNIQUE, cat_id INTEGER, slug TEXT UNIQUE, title_nl TEXT, title_en TEXT, title_fr TEXT, title_de TEXT, title_es TEXT, content_nl TEXT, content_en TEXT, content_fr TEXT, content_de TEXT, content_es TEXT)');
				
				tx.executeSql('CREATE TABLE IF NOT EXISTS WISHLIST (location_id INTEGER PRIMARY KEY UNIQUE, colorcat INTEGER)');
				
				tx.executeSql('DROP TABLE IF EXISTS MYLOCATIONS');
				tx.executeSql('CREATE TABLE IF NOT EXISTS MYLOCATIONS (id INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE, description TEXT, lat TEXT, lng TEXT)');
				
				
			}, function(){/*alert("db not created")*/}, function(){/*alert("db created");*/});
	
	
			if(data.categories)
			{
				

				$.each(data.categories, function(key, val)
		    	{
		    		db.transaction(function(tx)
					{
						var sql = "INSERT OR REPLACE INTO CATEGORIES (id, slug, title_nl, title_en, title_fr, title_de, title_es) VALUES (?,?,?,?,?,?,?)";
						var params = [key, val.slug, val.titel.nl, val.titel.en, val.titel.fr, val.titel.de, val.titel.de];
						tx.executeSql(sql, params);
						
					}, function(){/*alert("category "+key+" not created");*/}, function(){/*alert("category "+key+" created");*/});
		        		
		   		});
			}
	   		
	
	   		if(data.subcategories)
	   		{

	   			
		   		$.each(data.subcategories, function(key, val)
		    	{
		    		db.transaction(function(tx)
					{
						var sql = "INSERT OR REPLACE INTO SUBCATEGORIES (id, cat_id, slug, title_nl, title_en, title_fr, title_de, title_es, hidden) VALUES (?,?,?,?,?,?,?,?,?)";
						var params = [key, val.category_id, val.slug, val.titel.nl, val.titel.en, val.titel.fr, val.titel.de, val.titel.es, val.hide];
						tx.executeSql(sql, params);
						
					}, function(){/*alert("subcategory "+key+" not created");*/}, function(){/*alert("subcategory "+key+" created");*/});
		        		
		   		});
	   		}
	   		
	
	   		if(data.pages)
	   		{

	   			
		   		$.each(data.pages, function(key, val)
		    	{
		    		db.transaction(function(tx)
					{
						var sql = "INSERT OR REPLACE INTO PAGES (id, cat_id, slug, title_nl, title_en, title_fr, title_de, title_es, content_nl, content_en, content_fr, content_de, content_es) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
						var params = [key, val.category_id, val.slug, val.titel.nl, val.titel.en, val.titel.fr, val.titel.de, val.titel.de, val.inhoud.nl, val.inhoud.en, val.inhoud.fr, val.inhoud.de,val.inhoud.es];
						tx.executeSql(sql, params)
						
					}, function(){/*alert("page "+key+" not created");*/}, function(){/*alert("page "+key+" created");*/});
		        		
		   		});
	   		}
	   		
	   		
	   		var locationsCount = 0;
	   		
	   		if(data.locations)
	   		{
	

		   		$.each(data.locations, function(key, val)
		    	{
		    		
		    		var monday = "";
		    		var tuesday = "";
		    		var wednesday = "";
		    		var thursday = "";
		    		var friday = "";
		    		var saturday = "";
		    		var sunday = "";
		    		
		    		if(val.informatie.openingsuren)
		    		{
		    			var count = 0;
		    			
			    		$.each(val.informatie.openingsuren, function(day,hours)
			    		{
			    			
			    			switch(day)
			    			{
			    				case "0": sunday = getHours(hours); break;
			    				case "1": monday = getHours(hours); break;
			    				case "2": tuesday = getHours(hours); break;
			    				case "3": wednesday = getHours(hours); break;
			    				case "4": thursday = getHours(hours); break;
			    				case "5": friday = getHours(hours); break;
			    				case "6": saturday = getHours(hours); break;
			    				
								default:
								
									switch(count)
									{
										case 0: sunday = getHours(hours); break;
					    				case 1: monday = getHours(hours); break;
					    				case 2: tuesday = getHours(hours); break;
					    				case 3: wednesday = getHours(hours); break;
					    				case 4: thursday = getHours(hours); break;
					    				case 5: friday = getHours(hours); break;
					    				case 6: saturday = getHours(hours); break; 
									}
									
								break;
			    			}
			    			
			    			count++;
			    			
			    			function getHours(hours)
			    			{
			    				if(hours.length == 1)
			    				{
			    					
			    					return hours[0].start + " " + hours[0].end;
			    				}
			    				else if(hours.length == 2)
			    				{
									
			    					return hours[0].start + " " + hours[0].end + " " + hours[1].start + " " + hours[1].end;
			    				}
			    			}
			    		})
			    		
		    		}
		    		
		    		db.transaction(function(tx)
					{
						var sql = "INSERT OR REPLACE INTO LOCATIONS (id, cat_id, subcat_id, stick_to, slug, title_nl, title_en, title_fr, title_de, title_es, location_lat, location_lng, adress_street, adress_city, adress_postal, adress_country, adress_countrycode, adress_gmaps, adress_bing, adress_mapquest, adress_places, summary_nl, summary_en, summary_fr, summary_de, summary_es, description_nl, description_en, description_fr, description_de, description_es, email, telefoon, website_nl, website_en, website_fr, website_de, website_es, price_nl, price_en, price_fr, price_de, price_es, bcc_formula, bcc_nl, bcc_en, bcc_fr, bcc_de, bcc_es, monday, tuesday, wednesday, thursday, friday, saturday, sunday, closed_nl, closed_en, closed_fr, closed_de, closed_es, type, hotel_stars, hotelcond_nl, hotelcond_en, hotelcond_fr, hotelcond_de, hotelcond_es, restaurant_stars, restaurant_chef, images, open_nl, open_en, open_fr, open_de, open_es) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
						var params = [key, val.category_id, val.subcategory_id, val.stick_to, val.slug, val.title.nl, val.title.en, val.title.fr, val.title.de, val.title.es, val.locatie.lat, val.locatie.lng, val.adres.straat, val.adres.plaats, val.adres.postcode, val.adres.land, val.adres.landcode, val.adres.gmaps_link, val.adres.bing_link, val.adres.mapquest, val.adres.google_places_reference, val.omschrijving.kort.nl, val.omschrijving.kort.en, val.omschrijving.kort.fr, val.omschrijving.kort.de, val.omschrijving.kort.es, val.omschrijving.lang.nl, val.omschrijving.lang.en, val.omschrijving.lang.fr, val.omschrijving.lang.de, val.omschrijving.lang.es, val.informatie.email, val.informatie.telefoon, val.informatie.website.nl, val.informatie.website.en, val.informatie.website.fr, val.informatie.website.de, val.informatie.website.es, val.informatie.prijs.nl, val.informatie.prijs.en, val.informatie.prijs.fr, val.informatie.prijs.de, val.informatie.prijs.es, val.informatie.bcc_formule, val.informatie.bcc.nl, val.informatie.bcc.en, val.informatie.bcc.fr, val.informatie.bcc.de, val.informatie.bcc.es, monday, tuesday, wednesday, thursday, friday, saturday, sunday, val.informatie.gesloten.nl, val.informatie.gesloten.en, val.informatie.gesloten.fr, val.informatie.gesloten.de, val.informatie.gesloten.es, val.type, val.type_info.hotel.sterren, val.type_info.hotel.condities.nl, val.type_info.hotel.condities.en, val.type_info.hotel.condities.fr, val.type_info.hotel.condities.de, val.type_info.hotel.condities.es, val.type_info.restaurant.sterren, val.type_info.restaurant.chef, val.media.fotos, val.informatie.open.nl, val.informatie.open.en, val.informatie.open.fr, val.informatie.open.de, val.informatie.open.es];             
						tx.executeSql(sql, params);
					
					}, function(){alert("location "+key+" not created");}, function(){/*alert("location "+key+" created");*/});
		   		});
	   		}
	   		
	   		if(data.version)
			{

				$.each(data.version, function(key, val)
		    	{
		    		db.transaction(function(tx)
					{
						tx.executeSql('INSERT OR REPLACE INTO SETTINGS (key, value) VALUES ("version", "' +val+ '")');
						
					}, function(){
						
						navigator.notification.alert(
						    t.translate("error"),  				// message
						    alertDismissed,         			// callback
						    '',             					// title
						    t.translate("ok")                  	// buttonName
						);
						
					}, function(){
						
						callback();
						
					});
		        		
		   		});
			}
		
		})
   		
   	}
   	
   	function alertDismissed()
	{
		
	}
	
}
