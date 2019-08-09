function Content()
{
	
	var lang = window.localStorage.getItem("lang");
	var db = window.openDatabase("VisitBruges", "1.0", "Visit Bruges", 1000000);
	var t = new Translation();
	
	/*
	 * function defineContent
	 * defines what type of content got sent
	 */
	
	this.defineContent = function(type, id, callback)
	{

		switch(type)
		{
			case "page_sub":
			
				this.loadItems(id, function(results)
				{
					callback(results);
				})
				
			break;
			
			case "page_page":
			
				loadPage(id, function(results)
				{
					callback(results);
				})
			
			break;
			
			case "page_location":
			
			loadLocation(id, function(results)
			{
				callback(results);
			})
			
			break;
		}
	}
	
	this.loadItems = function(id, callback)
	{

		db.transaction(function(tx)
		{
			// alert("loaditems transaction");
			
			var selector = '"%' + id + '%"';
			
			tx.executeSql('SELECT id, cat_id, subcat_id, title_nl, title_en, title_fr, title_de, title_es, location_lat, location_lng, monday, tuesday, wednesday, thursday, friday, saturday, sunday FROM LOCATIONS WHERE subcat_id LIKE ' + selector, [], function(tx, results)
			{

				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
		
	}
	
	this.loadAllCats = function(callback)
	{
		
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT id, cat_id, subcat_id, title_nl, title_en, title_fr, title_de, title_es, location_lat, location_lng, monday, tuesday, wednesday, thursday, friday, saturday, sunday FROM LOCATIONS', [], function(tx, results)
			{

				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
		
	}
	
	this.loadAllItems = function(cat_id, callback)
	{
		
		db.transaction(function(tx)
		{
			
			//var selector = '"%' + cat_id + '%"';
			
			// var selector = cat_id LIKE '"' + cat_id + ',%"' or cat_id LIKE '"%,' + cat_id + ',%"' or cat_id LIKE '"%,' + cat_id + '"' or cat_id LIKE cat_id
			var s1 = '"' + cat_id + ',%"';
			var s2 = '"%,' + cat_id + ',%"';
			var s3 = '"%,' + cat_id + '"';
			var s4 = cat_id;

			tx.executeSql('SELECT id, cat_id, subcat_id, title_nl, title_en, title_fr, title_de, title_es, location_lat, location_lng, monday, tuesday, wednesday, thursday, friday, saturday, sunday FROM LOCATIONS WHERE cat_id LIKE ' + s1 + 'or cat_id LIKE ' + s2 + 'or cat_id LIKE ' + s3 + 'or cat_id LIKE ' + s4, [], function(tx, results)
			{

				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
		
	}
	
	function loadPage(id, callback)
	{
		db.transaction(function(tx)
		{
			
			tx.executeSql('SELECT * FROM PAGES WHERE id = ' + id, [], function(tx, results)
			{
				
				try
				{
					callback(results);
					
				}
				catch(e)
				{
					console.log(e);
				}
				
			}, errorCB);
			
		}, errorCB);
	}
	
	function loadLocation(id, callback)
	{
		
		db.transaction(function(tx)
		{
			// alert("loadlocation transaction");
			
			tx.executeSql('SELECT * FROM LOCATIONS WHERE id = ' + id, [], function(tx, results)
			{
				
				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
			}, errorCB);
			
		}, errorCB);
	}
	
	this.loadLunchDeals = function(callback)
	{
		
		db.transaction(function(tx)
		{
			// alert("loadlocation transaction");
			var selector = '"%' + 21 + '%"';
			
			tx.executeSql('SELECT * FROM LOCATIONS WHERE subcat_id LIKE ' + selector, [], function(tx, results)
			{


				try
				{
					callback(results);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
	}
	
	this.loadWishlist = function(callback)
	{

		db.transaction(function(tx)
		{
			
			tx.executeSql('SELECT LOCATIONS.*, WISHLIST.colorcat FROM LOCATIONS JOIN WISHLIST ON WISHLIST.location_id = LOCATIONS.id', [], function(tx, results)
			{
				
				try
				{
					callback(results);
					
				}
				catch(e)
				{
					console.log(e);
				}
				
			}, errorCB);
			
		}, errorCB);
	}
	
	this.getSlug = function(id, callback)
	{
		id = id.toString();
		var ids = id.split(",");
		var subcat_id = parseInt(ids[0]);

		db.transaction(function(tx)
		{
			
			tx.executeSql('SELECT slug FROM SUBCATEGORIES WHERE id = ' + subcat_id, [], function(tx, results)
			{
				
				try
				{
					callback(results.rows.item(0).slug);
				}
				catch(e)
				{
					console.log(e);
				}
				
				
			}, errorCB);
			
		}, errorCB);
		
	}
	
	/*
	 * function createPageWithItems
	 * creates page with a list of clickable items
	 */
	
	this.createPageWithItems = function(cat, items, callback)
	{

		for(var i = 0; i < items.rows.length; i++)
		{
			
			var colorClass = "";
			var iconClass = "";
			
			var cat_id;
		
			if(cat == 0)
			{
				var cats = items.rows.item(i).cat_id.toString();
				var _cats = cats.split(",");
				cat_id = parseInt(_cats[0]);
			}
			else
			{
				cat_id = cat;
			}
			
			switch(cat_id)
			{
				case 1: // visit arts & heritage
					colorClass = "cat_purple";
					iconClass = "icon_purple";
				break;
				case 2: // visit culture
					colorClass = "cat_blue";
					iconClass = "icon_blue";
				break;
				case 3: // visit hotels
					colorClass = "cat_cyan";
					iconClass = "icon_cyan";
				break;
				case 4: // visit food
					colorClass = "cat_orange";
					iconClass = "icon_orange";
				break;
				case 5: // visit outdoors
					colorClass = "cat_green";
					iconClass = "icon_green";
				break;
				case 20: // visit romance
					colorClass = "cat_pink";
					iconClass = "icon_pink";
				break;
				
			}
			
			var today = t.translate("geenopeningsuren");
			
			var alwaysopen = false;
		
			if(items.rows.item(i).monday == "" && items.rows.item(i).tuesday == "" && items.rows.item(i).wednesday == "" && items.rows.item(i).thursday == "" && items.rows.item(i).friday == "" && items.rows.item(i).saturday == "" && items.rows.item(i).sunday == "")
			{
				alwaysopen = true;
			}
			
			if(items.rows.item(i).monday != "")
			{
				
				var _monday = items.rows.item(i).monday.split(" ");
				if(_monday.length == 1)
				{
					var monday = secondstotime(_monday[0]) + t.translate("tot") + "-";
				}
				else if(_monday.length == 2)
				{
					var monday = secondstotime(_monday[0]) + t.translate("tot") + secondstotime(_monday[1]);
				}
				else if(_monday.length == 4)
				{
					var monday = secondstotime(_monday[0]) + t.translate("tot") + secondstotime(_monday[1]) + " - " + secondstotime(_monday[2]) + t.translate("tot") + secondstotime(_monday[3]);
				}

			}
			else if(alwaysopen == false)
			{ 
				var monday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).tuesday != "")
			{
				
				var _tuesday = items.rows.item(i).tuesday.split(" ");
				if(_tuesday.length == 1)
				{
					var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + "-";
				}
				else if(_tuesday.length == 2)
				{
					var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + secondstotime(_tuesday[1]);
				}
				else if(_tuesday.length == 4)
				{
					var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + secondstotime(_tuesday[1]) + " - " + secondstotime(_tuesday[2]) + t.translate("tot") + secondstotime(_tuesday[3]);
				}

			}
			else if(alwaysopen == false) 
			{
				var tuesday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).wednesday != "")
			{
				var _wednesday = items.rows.item(i).wednesday.split(" ");
				
				if(_wednesday.length == 1)
				{
					var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + "-";
				}
				else if(_wednesday.length == 2)
				{
					var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + secondstotime(_wednesday[1]);
				}
				else if(_wednesday.length == 4)
				{
					var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + secondstotime(_wednesday[1]) + " - " + secondstotime(_wednesday[2]) + t.translate("tot") + secondstotime(_wednesday[3]);
				}

			}
			else if(alwaysopen == false)
			{
				var wednesday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).thursday != "")
			{
				var _thursday = items.rows.item(i).thursday.split(" ");
				
				if(_thursday.length == 1)
				{
					var thursday = secondstotime(_thursday[0]) + t.translate("tot") + "-";
				}
				else if(_thursday.length == 2)
				{
					var thursday = secondstotime(_thursday[0]) + t.translate("tot") + secondstotime(_thursday[1]);
				}
				else if(_thursday.length == 4)
				{
					var thursday = secondstotime(_thursday[0]) + t.translate("tot") + secondstotime(_thursday[1]) + " - " + secondstotime(_thursday[2]) + t.translate("tot") + secondstotime(_thursday[3]);
				}

			}
			else if(alwaysopen == false)
			{
				var thursday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).friday != "")
			{
				var _friday = items.rows.item(i).friday.split(" ");
				if(_friday.length == 1)
				{
					var friday = secondstotime(_friday[0]) + t.translate("tot") + "-";
				}
				else if(_friday.length == 2)
				{
					var friday = secondstotime(_friday[0]) + t.translate("tot") + secondstotime(_friday[1]);
				}
				else if(_friday.length == 4)
				{
					var friday = secondstotime(_friday[0]) + t.translate("tot") + secondstotime(_friday[1]) + " - " + secondstotime(_friday[2]) + t.translate("tot") + secondstotime(_friday[3]);
				}
				
			}
			else if(alwaysopen == false)
			{
				var friday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).saturday != "")
			{
				var _saturday = items.rows.item(i).saturday.split(" ");
				if(_saturday.length == 1)
				{
					var saturday = secondstotime(_saturday[0]) + t.translate("tot") + "-";
				}
				else if(_saturday.length == 2)
				{
					var saturday = secondstotime(_saturday[0]) + t.translate("tot") + secondstotime(_saturday[1]);
				}
				else if(_saturday.length == 4)
				{
					var saturday = secondstotime(_saturday[0]) + t.translate("tot") + secondstotime(_saturday[1]) + " - " + secondstotime(_saturday[2]) + t.translate("tot") + secondstotime(_saturday[3]);
				}

			}
			else if(alwaysopen == false)
			{
				var saturday = t.translate("gesloten");
			}
			
			if(items.rows.item(i).sunday != "")
			{
				var _sunday = items.rows.item(i).sunday.split(" ");
				if(_sunday.length == 1)
				{
					var sunday = secondstotime(_sunday[0]) + t.translate("tot") + "-";
				}
				else if(_sunday.length == 2)
				{
					var sunday = secondstotime(_sunday[0]) + t.translate("tot") + secondstotime(_sunday[1]);
				}
				else if(_sunday.length == 4)
				{
					var sunday = secondstotime(_sunday[0]) + t.translate("tot") + secondstotime(_sunday[1]) + " - " + secondstotime(_sunday[2]) + t.translate("tot") + secondstotime(_sunday[3]);
				}

			}
			else if(alwaysopen == false)
			{
				var sunday = t.translate("gesloten");
			}
			
			var date = new Date();
			var day = date.getDay();
			
			if(alwaysopen == false)
			{
				switch(day)
				{
					case 0: if(sunday) today = sunday;
					case 1: if(monday) today = monday;
					case 2: if(tuesday) today = tuesday;
					case 3: if(wednesday) today = wednesday;
					case 4: if(thursday) today = thursday;
					case 5: if(friday) today = friday;
					case 6: if(saturday) today = saturday;
				}
				
			}
			
			var title = "";
			
			switch(lang)
			{
				case 'nl': title = items.rows.item(i).title_nl; break;
				case 'en': title = items.rows.item(i).title_en; break;
				case 'fr': title = items.rows.item(i).title_fr; break;
				case 'de': title = items.rows.item(i).title_de; break;
				case 'es': title = items.rows.item(i).title_es; break;
			}

			var item = '<li topcat="' + cat_id + '" class="item" id="' + items.rows.item(i).id + '"><div class="icon ' + iconClass +'"></div><span class="contents"><span class="itemtitle ' + colorClass + '">' + title + '</span><br /><span class="clock"></span><span class="closedinfo">' + today + '</span></span><div class="dummy"></div></li>'
			
			callback(items.rows.item(i).id, cat_id, title, colorClass, iconClass, item, items.rows.item(i).location_lat, items.rows.item(i).location_lng, items.rows.item(i).cat_id, today);

		}

		
	}
	
	/*
	 * function createPageWithContent
	 * creates page with static content
	 */
	
	this.createPageWithContent = function(cat_id, content, callback)
	{

		var title = "";
		var contents = "";
		
		switch(lang)
		{
			case 'nl': title = content.rows.item(0).title_nl; break;
			case 'en': title = content.rows.item(0).title_en; break;
			case 'fr': title = content.rows.item(0).title_fr; break;
			case 'de': title = content.rows.item(0).title_de; break;
			case 'es': title = content.rows.item(0).title_es; break;
		}
		
		switch(lang)
		{
			case 'nl': contents = content.rows.item(0).content_nl; break;
			case 'en': contents = content.rows.item(0).content_en; break;
			case 'fr': contents = content.rows.item(0).content_fr; break;
			case 'de': contents = content.rows.item(0).content_de; break;
			case 'es': contents = content.rows.item(0).content_es; break;
		}
		
		contents = convert(contents);
		
		var color = "";
				
		switch(cat_id)
		{
			case 1: // visit arts & heritage
				color = window.localStorage.getItem("purple");
			break;
			case 2: // visit culture
				color = window.localStorage.getItem("blue");
			break;
			case 3: // visit hotels
				color = window.localStorage.getItem("cyan");
			break;
			case 4: // visit food
				color = window.localStorage.getItem("orange");
			break;
			case 5: // visit outdoors
				color = window.localStorage.getItem("green");
			break;
			case 20: // visit romance
				color = window.localStorage.getItem("pink");
			break;
		}
		
		callback(content.rows.item(0).id, content.rows.item(0).cat_id, color, title, contents);
		
	}
	
	/*
	 * function createPageWithLocation
	 * creates page with information about a location
	 */
	
	this.createPageWithLocation = function(cat_id, location, callback)
	{


		var id = location.rows.item(0).id;
		var subcat_id = location.rows.item(0).subcat_id;
		var telefoon = location.rows.item(0).telefoon;
		var title = "";
		var contents = "";
		var website = "";
		var closed = "";
		var bcc = "";
		var price = "";
		var email = location.rows.item(0).email;
		var foto = location.rows.item(0).images;
		var subcatslug = "";
		var slug = location.rows.item(0).slug;

		switch(lang)
		{
			case 'nl': title = location.rows.item(0).title_nl; break;
			case 'en': title = location.rows.item(0).title_en; break;
			case 'fr': title = location.rows.item(0).title_fr; break;
			case 'de': title = location.rows.item(0).title_de; break;
			case 'es': title = location.rows.item(0).title_es; break;
		}

		switch(lang)
		{
			case 'nl': contents = location.rows.item(0).description_nl; break;
			case 'en': contents = location.rows.item(0).description_en; break;
			case 'fr': contents = location.rows.item(0).description_fr; break;
			case 'de': contents = location.rows.item(0).description_de; break;
			case 'es': contents = location.rows.item(0).description_es; break;
		}

		contents = convert(contents);
		
		switch(lang)
		{
			case 'nl': website = location.rows.item(0).website_nl; break;
			case 'en': website = location.rows.item(0).website_en; break;
			case 'fr': website = location.rows.item(0).website_fr; break;
			case 'de': website = location.rows.item(0).website_de; break;
			case 'es': website = location.rows.item(0).website_es; break;
		}
		
		switch(lang)
		{
			case 'nl': closed = location.rows.item(0).closed_nl; break;
			case 'en': closed = location.rows.item(0).closed_en; break;
			case 'fr': closed = location.rows.item(0).closed_fr; break;
			case 'de': closed = location.rows.item(0).closed_de; break;
			case 'es': closed = location.rows.item(0).closed_es; break;
		}
		
		var open_extra = "";
		
		switch(lang)
		{
			case 'nl': open_extra = location.rows.item(0).open_nl; break;
			case 'en': open_extra = location.rows.item(0).open_en; break;
			case 'fr': open_extra = location.rows.item(0).open_fr; break;
			case 'de': open_extra = location.rows.item(0).open_de; break;
			case 'es': open_extra = location.rows.item(0).open_es; break;
		}
		
		open_extra = convert(open_extra);

		closed = convert(closed);
		
		switch(lang)
		{
			case 'nl': bcc = location.rows.item(0).bcc_nl; break;
			case 'en': bcc = location.rows.item(0).bcc_en; break;
			case 'fr': bcc = location.rows.item(0).bcc_fr; break;
			case 'de': bcc = location.rows.item(0).bcc_de; break;
			case 'es': bcc = location.rows.item(0).bcc_es; break;
		}
		
		switch(lang)
		{
			case 'nl': price = location.rows.item(0).price_nl; break;
			case 'en': price = location.rows.item(0).price_en; break;
			case 'fr': price = location.rows.item(0).price_fr; break;
			case 'de': price = location.rows.item(0).price_de; break;
			case 'es': price = location.rows.item(0).price_es; break;
		}

		price = convert(price);
		
		var openinghours = "";
		var alwaysopen = false;
		
		if(location.rows.item(0).monday == "" && location.rows.item(0).tuesday == "" && location.rows.item(0).wednesday == "" && location.rows.item(0).thursday == "" && location.rows.item(0).friday == "" && location.rows.item(0).saturday == "" && location.rows.item(0).sunday == "")
		{
			alwaysopen = true;
		}

		if(location.rows.item(0).monday != "")
		{
			var _monday = location.rows.item(0).monday.split(" ");
			if(_monday.length == 2)
			{
				var monday = secondstotime(_monday[0]) + t.translate("tot") + secondstotime(_monday[1]);
			}
			else if(_monday.length == 4)
			{
				var monday = secondstotime(_monday[0]) + t.translate("tot") + secondstotime(_monday[1]) + " - " + secondstotime(_monday[2]) + t.translate("tot") + secondstotime(_monday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("maandag") + "</strong> " + monday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("maandag") + "</strong> " + t.translate("gesloten") + "<br />";
		}

		if(location.rows.item(0).tuesday != "")
		{
			var _tuesday = location.rows.item(0).tuesday.split(" ");
			if(_tuesday.length == 2)
			{
				var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + secondstotime(_tuesday[1]);
			}
			else if(_tuesday.length == 4)
			{
				var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + secondstotime(_tuesday[1]) + " - " + secondstotime(_tuesday[2]) + t.translate("tot") + secondstotime(_tuesday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("dinsdag") + "</strong> " + tuesday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("dinsdag") + "</strong> " + t.translate("gesloten") + "<br />";
		}

		if(location.rows.item(0).wednesday != "")
		{
			var _wednesday = location.rows.item(0).wednesday.split(" ");
			if(_wednesday.length == 2)
			{
				var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + secondstotime(_wednesday[1]);
			}
			else if(_wednesday.length == 4)
			{
				var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + secondstotime(_wednesday[1]) + " - " + secondstotime(_wednesday[2]) + t.translate("tot") + secondstotime(_wednesday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("woensdag") + "</strong> " + wednesday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("woensdag") + "</strong> " + t.translate("gesloten") + "<br />";
		}

		
		if(location.rows.item(0).thursday != "")
		{
			var _thursday = location.rows.item(0).thursday.split(" ");
			if(_thursday.length == 2)
			{
				var thursday = secondstotime(_thursday[0]) + t.translate("tot") + secondstotime(_thursday[1]);
			}
			else if(_thursday.length == 4)
			{
				var thursday = secondstotime(_thursday[0]) + t.translate("tot") + secondstotime(_thursday[1]) + " - " + secondstotime(_thursday[2]) + t.translate("tot") + secondstotime(_thursday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("donderdag") + "</strong> " + thursday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("donderdag") + "</strong> " + t.translate("gesloten") + "<br />";
		}
		

		if(location.rows.item(0).friday != "")
		{
			var _friday = location.rows.item(0).friday.split(" ");
			if(_friday.length == 2)
			{
				var friday = secondstotime(_friday[0]) + t.translate("tot") + secondstotime(_friday[1]);
			}
			else if(_friday.length == 4)
			{
				var friday = secondstotime(_friday[0]) + t.translate("tot") + secondstotime(_friday[1]) + " - " + secondstotime(_friday[2]) + t.translate("tot") + secondstotime(_friday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("vrijdag") + "</strong> " + friday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("vrijdag") + "</strong> " + t.translate("gesloten") + "<br />";
		}

		if(location.rows.item(0).saturday != "")
		{
			var _saturday = location.rows.item(0).saturday.split(" ");
			if(_saturday.length == 2)
			{
				var saturday = secondstotime(_saturday[0]) + t.translate("tot") + secondstotime(_saturday[1]);
			}
			else if(_saturday.length == 4)
			{
				var saturday = secondstotime(_saturday[0]) + t.translate("tot") + secondstotime(_saturday[1]) + " - " + secondstotime(_saturday[2]) + t.translate("tot") + secondstotime(_saturday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("zaterdag") + "</strong> " + saturday + "<br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("zaterdag") + "</strong> " + t.translate("gesloten") + "<br />";
		}
		
		if(location.rows.item(0).sunday != "")
		{
			var _sunday = location.rows.item(0).sunday.split(" ");
			if(_sunday.length == 2)
			{
				var sunday = secondstotime(_sunday[0]) + t.translate("tot") + secondstotime(_sunday[1]);
			}
			else if(_sunday.length == 4)
			{
				var sunday = secondstotime(_sunday[0]) + t.translate("tot") + secondstotime(_sunday[1]) + " - " + secondstotime(_sunday[2]) + t.translate("tot") + secondstotime(_sunday[3]);
			}
			
			openinghours = openinghours + "<strong>" + t.translate("zondag") + "</strong> " + sunday + "<br /><br />";
		}
		else if(alwaysopen == false)
		{
			openinghours = openinghours + "<strong>" + t.translate("zondag") + "</strong> " + t.translate("gesloten") + "<br /><br />";
		}
		
		openinghours = openinghours + open_extra;

		if(location.rows.item(0).adress_street != "")
		{
			var adress = location.rows.item(0).adress_street + ", " + location.rows.item(0).adress_city;
		}
		else
		{
			var adress = location.rows.item(0).adress_city;
		}

		var bcc_formula = location.rows.item(0).bcc_formula;
		
		
		var stars = "";
		var type = location.rows.item(0).type;
		var type_info = "";
		
		switch(location.rows.item(0).type)
		{
			case "hotel":
				stars = location.rows.item(0).hotel_stars;
				
				switch(lang)
				{
					case 'nl': type_info = location.rows.item(0).hotelcond_nl; break;
					case 'en': type_info = location.rows.item(0).hotelcond_en; break;
					case 'fr': type_info = location.rows.item(0).hotelcond_fr; break;
					case 'de': type_info = location.rows.item(0).hotelcond_de; break;
					case 'es': type_info = location.rows.item(0).hotelcond_es; break;
				}
			
			break;
			
			case "restaurant":
				stars = location.rows.item(0).restaurant_stars;
				type_info = t.translate("chef") + location.rows.item(0).restaurant_chef;
			break;
		}
	
		
		var color = "";
				
		cat_id = parseInt(cat_id);
			
		switch(cat_id)
		{
			case 1: // visit arts & heritage
				color = window.localStorage.getItem("purple");
			break;
			case 2: // visit culture
				color = window.localStorage.getItem("blue");
			break;
			case 3: // visit hotels
				color = window.localStorage.getItem("cyan");
			break;
			case 4: // visit food
				color = window.localStorage.getItem("orange");
			break;
			case 5: // visit outdoors
				color = window.localStorage.getItem("green");
			break;
			case 20: // visit romance
				color = window.localStorage.getItem("pink");
			break;
		}
		

		callback(id, cat_id, subcat_id, color, title, contents, website, email, telefoon, openinghours, closed, bcc_formula, bcc, adress, location.rows.item(0).location_lat, location.rows.item(0).location_lng, stars, type, type_info, price, foto, slug, subcatslug);
			
	}
	
	
	/*
	 * function createPageWithLunchdeals
	 * creates page with a list of clickable items
	 */
	
	this.createPageWithLunchdeals = function(cat_id, items, callback)
	{
		
		for(var i = 0; i < items.rows.length; i++)
		{
			
			colorClass = "cat_pink";
			iconClass = "icon_pink";

			var title = "";
			
			switch(lang)
			{
				case 'nl': title = items.rows.item(i).title_nl; break;
				case 'en': title = items.rows.item(i).title_en; break;
				case 'fr': title = items.rows.item(i).title_fr; break;
				case 'de': title = items.rows.item(i).title_de; break;
				case 'es': title = items.rows.item(i).title_es; break;
			}

			var price = ""
			
			switch(lang)
			{
				case 'nl': price = items.rows.item(i).price_nl; break;
				case 'en': price = items.rows.item(i).price_en; break;
				case 'fr': price = items.rows.item(i).price_fr; break;
				case 'de': price = items.rows.item(i).price_de; break;
				case 'es': price = items.rows.item(i).price_es; break;
			}
			
			var price = convert(price);

			var stars = items.rows.item(i).restaurant_stars;
			
			//var item = '<li topcat="' + cat_id + '" class="item" id="' + items.rows.item(i).id + '"><span class=lunchdealtitle ' + colorClass + '">' + title + '</span><div class="dummy"></div></li>'
			
			var item = '<li topcat="' + cat_id + '" class="item" id="' + items.rows.item(i).id + '"><div class="icon ' + iconClass +'"></div><span class="contents"><span class="itemtitle ' + colorClass + '">' + title + '</span><br /><span class="clock"></span><span class="closedinfo">' + t.translate("geenopeningsuren") + '</span></span><div class="dummy"></div></li>'
			
			callback(items.rows.item(i).id, item, items.rows.item(i).lat, items.rows.item(i).lng, stars);
			
			// list = list + item;
			
		}

	}
	
	this.getMyLocations = function(callback)
	{
		
		db.transaction(function(tx)
		{
			
			tx.executeSql('SELECT * FROM MYLOCATIONS', [], function(tx, results)
			{
				
				if(results.rows.length == 0)
				{
					callback(false, null, null, null);
				}
				else
				{
					for(var i = 0; i < results.rows.length; i++)
					{
						var description = results.rows.item(i).description;
						var lat = results.rows.item(i).lat;
						var lng = results.rows.item(i).lng;
						var id = results.rows.item(i).id;
						callback(true, id, description, lat, lng);
					}
				}
			
				
			}, function()
			{
				//
				
			});
			
		}, errorCB);
	}
	
	this.addLocation = function(name, lat, lng, callback)
	{
		db.transaction(function(tx)
		{
			tx.executeSql('INSERT OR REPLACE INTO MYLOCATIONS (description, lat, lng) VALUES (?,?,?)', [name, lat, lng], function(tx, results)
			{
				callback(results.insertId);
				
			}, errorCB);

		}, errorCB)
	}
	
	this.removeLocation = function(id, callback)
	{
		db.transaction(function(tx)
		{
			tx.executeSql('DELETE FROM MYLOCATIONS WHERE id = ' + id);
			
		}, errorCB, function(){callback();})
	}
	
	this.addToWishlist = function(id, cat_id, callback)
	{
		db.transaction(function(tx)
		{
			var sql = 'INSERT OR REPLACE INTO WISHLIST (location_id, colorcat) VALUES (?,?)';
			var params = [id, cat_id];
			tx.executeSql(sql, params);
			
		}, errorCB, function(){callback();})
			
	}
	
	this.removeFromWishlist = function(id, callback)
	{
		db.transaction(function(tx)
		{
			tx.executeSql('DELETE FROM WISHLIST WHERE location_id = ' + id);
			
		}, errorCB, function(){callback(true);})
	}
	
	this.isAddedToWishlist = function(id, callback)
	{
		
		db.transaction(function(tx)
		{
			tx.executeSql('SELECT * FROM WISHLIST WHERE location_id = ' + id, [], function(tx,results)
			{

				if(results.rows.length > 0)
				{
					callback(true);
				}
				else
				{
					callback(false);
				}
				
			}, errorCB)
			
		}, errorCB)
	}
	
	this.showWishlist = function(items, callback)
	{
		
		for(var i = 0; i < items.rows.length; i++)
		{
			
			var colorClass = "";
			var iconClass = "";
			
			/*var cat_ids = items.rows.item(i).cat_id.toString();
			var cat_id_array = cat_ids.split(",");
			var cat_id = cat_id_array[0];*/
			
			cat_id = parseInt(items.rows.item(i).colorcat);


			switch(cat_id)
			{
				case 1: // visit arts & heritage
					colorClass = "cat_purple";
					iconClass = "icon_purple";
				break;
				case 2: // visit culture
					colorClass = "cat_blue";
					iconClass = "icon_blue";
				break;
				case 3: // visit hotels
					colorClass = "cat_cyan";
					iconClass = "icon_cyan";
				break;
				case 4: // visit food
					colorClass = "cat_orange";
					iconClass = "icon_orange";
				break;
				case 5: // visit outdoors
					colorClass = "cat_green";
					iconClass = "icon_green";
				break;
				case 20: // visit romance
					colorClass = "cat_pink";
					iconClass = "icon_pink";
				break;
				
			}
			
			var today = t.translate("geenopeningsuren");
			
			if(items.rows.item(i).monday)
			{
				var _monday = items.rows.item(i).monday.split(" ");
				var monday = secondstotime(_monday[0]) + t.translate("tot") + secondstotime(_monday[1]);
				
				var _tuesday = items.rows.item(i).tuesday.split(" ");
				var tuesday = secondstotime(_tuesday[0]) + t.translate("tot") + secondstotime(_tuesday[1]);
				
				var _wednesday = items.rows.item(i).wednesday.split(" ");
				var wednesday = secondstotime(_wednesday[0]) + t.translate("tot") + secondstotime(_wednesday[1]);
				
				var _thursday = items.rows.item(i).thursday.split(" ");
				var thursday = secondstotime(_thursday[0]) + t.translate("tot") + secondstotime(_thursday[1]);
				
				var	_friday = items.rows.item(i).friday.split(" ");
				var friday = secondstotime(_friday[0]) + t.translate("tot") + secondstotime(_friday[1]);
				
				var _saturday = items.rows.item(i).saturday.split(" ");
				var saturday = secondstotime(_saturday[0]) + t.translate("tot") + secondstotime(_saturday[1]);
				
				var _sunday = items.rows.item(i).sunday.split(" ");
				var sunday = secondstotime(_sunday[0]) + t.translate("tot") + secondstotime(_sunday[1]);

				var date = new Date();
				var day = date.getDay();
				
				switch(day)
				{
					case 0: today = sunday;
					case 1: today = monday;
					case 2: today = tuesday;
					case 3: today = wednesday;
					case 4: today = thursday;
					case 5: today = friday;
					case 6: today = saturday;
				}
			}

			var title = "";
			
			switch(lang)
			{
				case 'nl': title = items.rows.item(i).title_nl; break;
				case 'en': title = items.rows.item(i).title_en; break;
				case 'fr': title = items.rows.item(i).title_fr; break;
				case 'de': title = items.rows.item(i).title_de; break;
				case 'es': title = items.rows.item(i).title_es; break;
			}
			
			var item = '<li topcat="' + cat_id + '" class="item" id="' + items.rows.item(i).id + '"><div class="icon ' + iconClass +'"></div><span class="contents"><span class="itemtitle ' + colorClass + '">' + title + '</span><br /><span class="clock"></span><span class="closedinfo">' + today + '</span></span><div class="dummy"></div><span class="deletebutton button"></span></li>'
			
			var location = new google.maps.LatLng(items.rows.item(i).location_lat,items.rows.item(i).location_lng);
			
			callback(items.rows.item(i).cat_id, title, colorClass, iconClass, item, location, items.rows.item(i).cat_id);
		
		}
			
	}
	
	function getTime()
	{
		var now = new Date();
		now = now.format("s");
		return now;
	}
	
	function secondstotime(secs)
	{
		
		if(secs == 0)
		{
			return "--";
		}
		
		var leftover = secs;
		var hours = Math.floor(leftover/3600);
		leftover = leftover - (hours * 3600);
		var minutes = leftover / 60;
		
		if(minutes == 0)
		{
			return hours + t.translate("u");
		}
		else
		{
			return hours + t.translate("u") + minutes;
		}
	   
	}
	
	function convert(convert)
	{
		return $("<span />", { html: convert }).text();
	};
	
	function errorCB(error)
	{
		console.log("content.js - " + error.message);
	}
	
}

