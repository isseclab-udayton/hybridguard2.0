
window.localStorage.setItem("purple", "#9d2de4");
window.localStorage.setItem("blue", "#0cb7ff");
window.localStorage.setItem("cyan", "#004dff");
window.localStorage.setItem("green", "#00ad8c");
window.localStorage.setItem("orange", "#ff450c");
window.localStorage.setItem("pink", "#ff2998");

var t = new Translation();
var heritagewalk;
$showsubheader = false;
var slideNavigation = true;

var myScroll_sub;
var myScroll_page;
var myScroll_location;
var myScroll_lunchdeals;
var myScroll_wishlist;
var myScroll_heritagewalk;
var myScroll_sidebar;


/*
 * function onDeviceReady
 * checks if device is ready + checks if there's a specific language set
 */

function init()
{
	document.addEventListener("deviceready", onDeviceReady, false);
	document.addEventListener("backbutton", function(){}, true);
}

function onDeviceReady() 
{
	
	navigator.app.overrideBackbutton(true);
	
	$(".language").hide();

	// check or insert language
	var lang = new Language();
	lang.checkLanguage(function(result)
	{
		
		$(".init").removeClass("hidden");
		
		if(result == true)
		{
			// already a language set
			preInitialize();
		}
		else
		{
			// no language set yet
			$(".language").fadeIn();
			$(".languagepicker").removeClass("lpdown");
	    	$(".chooselanguage").bind("click", function(e)
	    	{
	    		var lng = $(this).attr("l");
	    		lang.setLanguage(lng, function(result)
	    		{
	    			$(".languagepicker").addClass("lpdown");
	    			$(".language").delay(300).fadeOut();
	    			setTimeout(function()
	    			{
	    				preInitialize();
	    			}, 400);
	    			
	    		});
	    		
	    	});
	    	
		}	
		
	});

}

	
/*
 * function preInitialize
 * check if there's data added
 */

function preInitialize()
{

	$(".loading").removeClass("hidden");

	var dataHandler = new DataHandler();
    dataHandler.checkData(function(result)
    {

    	if(result)
    	{
    		initializeApp();
    	}
    	else
    	{
    		dataHandler.storeData(function()
    		{
    			preInitialize();
    		});
    		
    	}
    	
    });
    
}


/*
 * function initializeApp
 * build homescreen, attach click handlers
 */

function initializeApp()
{
	
	$("body").live("swipeleft", function()
	{
		closeNavigation();
	})
	
	$("body").live("swiperight", function()
	{
		if(slideNavigation == true) openNavigation();
	})	
	
	

	myScroll_sub = new iScroll('wrapper_sub');	
	myScroll_page = new iScroll('wrapper_page');
	myScroll_location = new iScroll('wrapper_location');
	myScroll_wishlist = new iScroll('wrapper_wishlist');
	myScroll_lunchdeals = new iScroll('wrapper_lunchdeals');
	myScroll_heritagewalk = new iScroll('wrapper_heritagewalk');	
	myScroll_sidebar = new iScroll('wrapper_sidebar');
			
	document.addEventListener('touchmove', function(e){ e.preventDefault(); });
	document.addEventListener('DOMContentLoaded', function () { setTimeout(loaded, 200); }, false);
	
	updateCurrentPage("page_home");
	
	$(".init").addClass("hidden");
	$(".pages").removeClass("hidden");
	$(".page_home").removeClass("hidden");
	$("header").removeClass("hidden");
	$(".mapButton").addClass("hidden");
	
	// apply language
	
	$("#walkbutton .buttontitle").append(t.translate("erfgoedwandeling"));
	$("#foodbutton .buttontitle").append(t.translate("lunchacties"));
	$("#wishlistbutton .buttontitle").append(t.translate("wishlist"));
	$("#weatherbutton .buttontitle").append(t.translate("weer"));
	$(".showfilterlink span").append(t.translate("toonalles"));
	
	// create content variable
	
	var content = new Content();
	heritagewalk = new HeritageWalk();

	// load filter
	
	var filter = new Filter();
	
	filter.loadCategories(function(categories)
	{

		$(".sidebar").append(categories);
		
		if(!$(".cat:first").attr("fullheight"))
		{
			$(".cat").each(function(e)
			{
				$this = $(this);
				var newHeight = $this.find("span").height() + 32;
				$this.height(newHeight).attr("fullheight", newHeight);
			})
		}
		
		$(".cat").click(function(e)
		{
			
			var selectedcat = $(this).attr("cat_id");
			var color = $(this).attr("itemcolor");
			
			if($(this).hasClass("activecat"))
			{
				
				$(this).removeClass("activecat");
				$(this).css({
					backgroundColor: "#111111",
					borderWidth: 1
				}, 400)
				// uit

				$(".cat").not($(this)).each(function()
				{
					$(this).css({
						borderWidth: 1,
						opacity: 1,
						height: parseInt($(this).attr("fullheight")),
						'-webkit-transform': 'translate3d(0, 0, 0)'
					}, 400);
					
				})
				
				$(".subsidebar:first").css({
					'-webkit-transform': 'translate3d(0, 400px, 0)',
					opacity: 0
				})
				
				$(".showfilterlink").css({
					height: 0,
					opacity: 0,
					borderWidth: 0
				})
				
			}
			else
			{
				
				$(this).addClass("activecat");
				$(this).css({
					backgroundColor: color,
					borderWidth: 0
				}, 400)
				var cat_id = parseInt($(this).attr("cat_id"));
				
				content.loadAllItems(cat_id, function(results)
				{
					$showsubheader = false;
					updateCurrentPage("page_cat");
					navigateTo("page_sub", cat_id, results);
				});
				

				$this = $(this);
				
				$(".cat").not($(this)).css({
					overflow: 'hidden',
					borderWidth: 0,
					height: 0,
					opacity: 0,
					'-webkit-transform': 'translate3d(0, 0, 0)'
				}, 400);
				
				var topspace = parseInt($(this).attr("fullheight")) + 1;
				var total = 400 - topspace - topspace - 5;
				var sidebarheight = window.innerHeight - 60 - topspace - topspace;
				
				setTimeout(function()
				{
					$(".showfilterlink").css({
						height: 54,
						opacity: 1,
						borderWidth: 1
					})
					
				}, 400)
				
				
				$(".subsidebar .items").empty();
				
				filter.loadSubItems(selectedcat, function(results)
				{
					$(".subsidebar .items").append(results);
					
					setTimeout(function()
					{
						$(".subsidebar:first").css({
							'-webkit-transform': 'translate3d(0, -' + total + 'px, 0)',
							opacity: 1,
							height: sidebarheight
						})
					}, 400)
					
					
					$(".sub").unbind('click').click(function(e)
					{
						
						
						
						$showsubheader = false;
						closeNavigation();
						updateHistory("");
						updateCurrentPage("page_sub");
						var content_id = $(this).attr("id");
						window.localStorage.setItem("sub", content_id);
						window.localStorage.setItem("fromcategory", "false");
						var content_type = $(this).attr("type");
						var cat_id = $(this).attr("topcat");
						cat_id = parseInt(cat_id);
						
						content.defineContent(content_type, content_id, function(results)
						{
							if(content_type == "page_location")
							{
								updateCurrentPage("page_cat");
							}
							else
							{
								updateCurrentPage("page_sub");
							}
							navigateTo(content_type, cat_id, results);
						});
						
					})
					
					$("#wrapper_sidebar").css({
						height: sidebarheight
					});
					
					$("#scroller_sidebar").height($(".scrollable_sidebar").height());
					myScroll_sidebar.refresh();
					myScroll_sidebar.scrollTo(0,0);
					
				})
				
			}		
			
		})
		
	});
	
	$(".showfilterlink").unbind("click").click(function()
	{
		resetFilter();
		content.loadAllCats(function(results)
		{
			window.localStorage.setItem("allcats", "true");
			updateHistory("page_all");
			updateCurrentPage("page_all");
			navigateTo("page_sub", null, results);
		
		})
	})
	
	// navigate your way back home

	$("#mainheader h1").live('tap', function()
	{
		if(window.localStorage.getItem("currentpage") != "page_home")
		{
			updateCurrentPage("page_home");
			resetFilter();
			closeNavigation();
			navigateTo("page_home");
		}
		
	})
	
	
	// click the buttons on the homescreen
	
	$("#walkbutton").click(function(e)
	{
		updateHistory("page_home");
		updateCurrentPage("page_heritagewalk");
		
		closeNavigation();
		
		$(".mapButton").addClass("hidden");
		
		openSubheader(t.translate("erfgoedwandeling"), "#101010");
		
		navigateTo("page_heritagewalk", 1, null);
		
	})
	
	$("#foodbutton").click(function(e)
	{
		updateHistory("page_home");
		updateCurrentPage("page_sub");

		$(".mapButton").addClass("hidden");
		
		openSubheader(t.translate("lunchacties"), "#ff2998");
		
		content.loadLunchDeals(function(results)
		{
			navigateTo("page_lunchdeals", 4, results);
		})
		
	})
	
	$("#wishlistbutton").click(function(e)
	{
		updateHistory("page_home");
		updateCurrentPage("page_wishlist");
		
		closeNavigation();
		
		openSubheader(t.translate("wishlist"), "#101010");
		content.loadWishlist(function(results)
		{
			navigateTo("page_wishlist", null, results);
		})
		
	});
	
	$("#weatherbutton").click(function(e)
	{
		
		var con = getConnection();
		if(con == "bad")
		{
			navigator.notification.alert( t.translate("geenverbindinginfo"), function(){}, t.translate("geenverbinding"), t.translate("ok"));
		}
		else
		{
			updateHistory("page_home");
			updateCurrentPage("page_weather");

			closeNavigation();
			
			openSubheader(t.translate("weer"), "#91cbe1");
			navigateTo("page_weather", null);
		}
		
	});
	
	$("#mylocationsbutton").click(function(e)
	{
		
		var con = getConnection();
		if(con == "bad")
		{
			navigator.notification.alert( t.translate("geenverbindinginfo"), function(){}, t.translate("geenverbinding"), t.translate("ok"));
		}
		else
		{

			updateHistory("page_home");
			updateCurrentPage("page_mylocations");
			
			closeNavigation();
			
			openSubheader(t.translate("mijnlocaties"), "#101010");
			navigateTo("page_mylocations", null);
		
		}
	});
	
	// back button
	
	$(".backButton").unbind('tap').bind('tap', function(e)
	{
		$(".h_subnavigation").hide();
		$showsubheader = false;
		
		switch(window.localStorage.getItem("history"))
		{
			case "page_home":
			
				// you are on a static page and want to go back home
				navigateTo("page_home");
				resetFilter();
				closeSubheader();
				
			break;
			
			case "page_wishlist":
			
				// you clicked on an item in your wishlist and want to go back to the wishlist
				content.loadWishlist(function(results)
				{
					navigateTo("page_wishlist", null, results);
					openSubheader("Wishlist");
					$("#subheader").css({
						'background-color': '#101010'
					})
					
				});
				
			break;
			
			case "page_lunchdeals":
			
				// you clicked on an item in your wishlist and want to go back to the wishlist
				content.loadLunchDeals(function(results)
				{
					navigateTo("page_lunchdeals", 20, results);
					openSubheader(t.translate("lunchacties"));
					$("#subheader").css({
						'background-color': '#ff2998'
					})
				})
				
			break;
			
			case "page_heritagewalk":
			
				// you clicked on an item in your wishlist and want to go back to the wishlist
				heritagewalk.getLocations(function(results)
				{
					navigateTo("page_heritagewalk", 1, results);
					openSubheader(t.translate("erfgoedwandeling"));
					$("#subheader").css({
						'background-color': '#101010'
					})
					
				});
				
			break;
			
			case "page_all":
			
				content.loadAllCats(function(results)
				{
					window.localStorage.setItem("allcats", "true");
					updateCurrentPage("page_all");
					navigateTo("page_sub", null, results);
					closeSubheader();
				
				})
			
			break;
			
			case "page_cat":
			
				var cat_id = parseInt($(this).attr("cat_id"));
				content.loadAllItems(cat_id, function(results)
				{
					updateCurrentPage("page_cat");
					navigateTo("page_sub", cat_id, results);
					closeSubheader();
				})
			
			break;
			
			default:
				
				// you're browsing through subcategories and want to go back to the latest subcategory
				var subcat_id = parseInt(window.localStorage.getItem("sub"));
				var cat_id = parseInt($(this).attr("cat_id"));

				// content has to be redefined, otherwise google maps won't show any markers
				content.loadItems(subcat_id, function(results)
				{
					updateCurrentPage("page_sub");
					navigateTo("page_sub", cat_id, results);
					closeSubheader();
				})

			break;
		}
		
	});
	
	
	// toggle sidebar
	
	
	$navtoggle = false;
	
	$("#mainheader .toggleNavButton").click(function(e)
	{
		
		if($navtoggle == false)
		{
			openNavigation();
			if(window.localStorage.getItem("currentpage") == "page_home")
			{
				content.loadAllCats(function(results)
				{
					window.localStorage.setItem("allcats", "true");
					updateHistory("page_home");
					updateCurrentPage("page_all");
					setTimeout(function()
					{
						navigateTo("page_sub", null, results);
					},400)
					
				})
			}
			
		}
		else
		{	
			closeNavigation();
			
			// if(window.localStorage.getItem("currentpage") == "page_all")
			
			if($showsubheader == true)
			{
				openSubheader();
			}
		}
			
	});
	
	$("#subheader .toggleNavButton").click(function(e)
	{
		
		// $showsubheader = true;
 
		if($navtoggle == false)
		{
			// $showsubheader = true;
			closeSubheader();
			openNavigation();
		}
		else
		{	
			openSubheader();
			closeNavigation();
		}
		
	});
	
}

function resetFilter()
{
	
	$(".cat").each(function()
	{
		$(this).css({
			borderWidth: 1,
			opacity: 1,
			height: parseInt($(this).attr("fullheight")),
			'-webkit-transform': 'translate3d(0, 0, 0)',
			backgroundColor: "#111111"
		}, 400);
		
		$(this).removeClass("activecat");
	})
	
	$(".subsidebar:first").css({
		'-webkit-transform': 'translate3d(0, 400px, 0)',
		opacity: 0
	})
	
	$(".showfilterlink").css({
		height: 0,
		opacity: 0,
		borderWidth: 0
	})
	
}


/*
 * function navigateTo(page)
 * handles browsing through pages
 */


function navigateTo(page, cat_id, results)
{
	
	slideNavigation = false;
	
	// create content var
	var content = new Content();

	$(".page").not(".page[page=" + page + "]").addClass("hidden");
	$(".page[page=" + page + "]").removeClass("hidden");

	$(".pages").scrollTop(0);
	
	$("#headMapButton").addClass("hidden");
	$("#subMapButton").addClass("hidden");

	
	switch(page)
	{
		
		case("page_home"):
		
			updateCurrentPage("page_home");
			slideNavigation = true;

			$("#headMapButton").addClass("hidden");
			$maptoggle = false;
		
		break;
		
		case("page_sub"):
		
			slideNavigation = true;

			// reset views
			$maptoggle = false;
			$("#headMapButton").css({
				
				"background-image": "url(img/mapbutton.png)"
			})
		
			if(results)
			{
				
				// clear template
				$(".page_sub .list").empty().show();
				$(".page_sub #map").hide();
				$(".page_sub .map_info").hide();

				var markers = [];
				
				if(cat_id == null) cat_id = 0;
				
				content.createPageWithItems(cat_id, results, function(id, cat, title, colorClass, iconClass, item, lat, lng, category, openinghours)
				{
	
					var marker = new Object;
					
					marker.id = id;
					marker.title = title;
					marker.color = colorClass;
					marker.icon = iconClass;
					marker.lat = lat;
					marker.lng = lng;
					marker.category = cat;
					marker.openinghours = openinghours;
					
					markers.push(marker);
					
					$(".page_sub .list").append(item);
					
				})
				
				if($navtoggle == false)
				{
					setTimeout(function()
					{
						$("#headMapButton").removeClass("hidden");
						
					}, 500)
					
				}
				
				$("#headMapButton").unbind("click").click(function(e)
				{
					
					var con = getConnection();
					
					if(con == "bad")
					{
						navigator.notification.alert(t.translate("m_desc"), function(){}, t.translate("m_no"), 'Ok');
					}
					else
					{
						if($maptoggle == false)
						{
							$(".page_sub #map").show();
							$(".page_sub .map_info").hide();
							$("#headMapButton").css({
								backgroundImage: "url(img/listbutton.png)"
							})
							var map = new Map();
							map.createMap("map", markers);
							$maptoggle = true;
				
						}
						else if($maptoggle == true)
						{
							$(".page_sub #map").hide();
							$(".page_sub .map_info").hide();
							$("#headMapButton").css({
								"background-image": "url(img/mapbutton.png)"
							})
							$maptoggle = false;
						}
					}

				})
				
				$(".page_sub .list li").bind('tap', function(e)
				{

					closeNavigation();
					var content_id = $(this).attr("id");
					var category_id = $(this).attr("topcat");
					var content_type = "page_location";
					
					content.defineContent(content_type, content_id, function(results)
					{
						
						if(window.localStorage.getItem("currentpage") == "page_sub")
						{
							updateHistory("page_sub");
						}
						else if (window.localStorage.getItem("currentpage") == "page_cat")
						{
							updateHistory("page_cat");
						}
						else if(window.localStorage.getItem("currentpage") == "page_all")
						{
							updateHistory("page_all");
						}
						
						navigateTo(content_type, category_id, results);
						
					});
					
				})
				
			}
			
			$("#wrapper_sub").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_sub").height($(".scrollable_sub").height());
			myScroll_sub.refresh();
			myScroll_sub.scrollTo(0,0);
			
		break;
		
		case("page_page"):
		
			if(results)
			{
				// create regular content page
				content.createPageWithContent(cat_id, results, function(id, cat_id, color, title, content)
				{
					openSubheader(title, color);
					$(".page_page .content p").empty().html(content);
				})
				
			}

			$("#wrapper_page").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_page").height($(".scrollable_page").height());
			myScroll_page.refresh();
			myScroll_page.scrollTo(0,0);
			
		break;
		
		case("page_location"):
		
			if(window.localStorage.getItem("currentpage") == "page_sub") updateHistory("page_sub");
			if(window.localStorage.getItem("currentpage") == "page_all") updateHistory("page_all");
			updateCurrentPage("page_location");
		
			$submaptoggle = false;
			$(".page_location .content").show();
			$(".page_location #locationmap").hide();
			$("#subMapButton .pointer").css({
				backgroundImage: "url(img/mapbutton.png)",
				'background-size': "35%"
			})
			
			$(".page_location .content .title_openinghours .title").empty().append(t.translate("openingsuren"));
			$(".title_closed span").empty().append(t.translate("gesloten"));
			$(".title_price .title").empty().append(t.translate("prijs"));
			$(".title_bcc .title").empty().append(t.translate("bruggecitycard"));
			$(".reserveerbutton").empty().append("<span>" + t.translate("reserveren") + "</span>").hide();
			$(".sharebutton").empty().append("<span>" + t.translate("delen") + "</span>");
			$(".locationimage").hide();
		
			if(results)
			{
				
				var markers = [];
				
				content.createPageWithLocation(cat_id, results, function(id, category, subcat_id, color, title, contents, website, email, telefoon, openinghours, closed, bcc_formula, bcc_info, adress, lat, lng, stars, type, type_info, price, foto, slug, subcatslug)
				{
					
					if(window.localStorage.getItem("history") == "page_wishlist")
					{
						changeSubheader(title, color);
					}
					else if(window.localStorage.getItem("history") == "page_heritagewalk")
					{
						changeSubheader(title, color);
					}
					else if(window.localStorage.getItem("history") == "page_lunchdeals")
					{
						changeSubheader(title, color);
					}
					else
					{
						openSubheader(title, color);
					}
					
					var wishlisttoggle = false;
					
					content.isAddedToWishlist(id, function(result)
					{
						
						if(result == true)
						{
							wishlisttoggle = true;
							
							$(".content .addtowishlistbutton").css({
								'background-color': color
							})
							
						}
						else
						{
							wishlisttoggle = false;
							
							$(".content .addtowishlistbutton").css({
								'background-color': '#101010'
							})
							
						}
					})
					
					$(".content .addtowishlistbutton").bind("tap", function()
					{
						if(wishlisttoggle == true)
						{
							
							$(".content .addtowishlistbutton").unbind("click").click(function()
							{
								
								var wishid = $(this).attr("item_id");
								content.removeFromWishlist(wishid, function()
								{
	
									$(".content .addtowishlistbutton").css({
										backgroundColor: '#101010'
									})
									
									wishlisttoggle = false;
								});
								
							})
						}
						else
						{
							$(".content .addtowishlistbutton").unbind("click").click(function()
							{
								
								var wishid = $(this).attr("item_id");
								var wishcat = $(this).attr("cat_id");
								content.addToWishlist(wishid, wishcat, function()
								{
	
									$(".content .addtowishlistbutton").css({
										backgroundColor: color
									})
									
									wishlisttoggle = true;
								});

							})
						}
					})
					
					// pass info through the back button
					$("#subheader .backButton").attr("cat_id", cat_id);
					$("#subheader .backButton").attr("subcat_id", subcat_id);

					// change colors
					$("h3").css({
						color: color
					})
					
					$(".content .adres").css({
						color: color
					})
					
					$(".sub_icon").css({
						backgroundColor: color
					})
					
					// apply content to the page
					
					
					var newsize = parseInt(window.innerWidth - 40);
					
					if(foto != "")
					{
						_fotos = foto.split(" ");
						$(".locationimage").attr("src", "RESOURCES/" + _fotos[0]).show();
						$(".locationimage").css({
							width: newsize,
							height: newsize
						});
					}
					
					
					if(openinghours != "")
					{
						$(".content .openinghours").show();
						$(".content .title_openinghours").show();
						$(".content .openinghours").empty().append(openinghours);
					}
					else
					{
						$(".content .openinghours").hide();
						$(".content .title_openinghours").hide();
					}
					
					if(closed != "")
					{
						$(".content .closed").show();
						$(".content .title_closed").show();
						$(".content .closed").empty().append(closed);
					}
					else
					{
						$(".content .closed").hide();
						$(".content .title_closed").hide();
					}
					
					if(bcc_info != "")
					{
						$(".content .bcc").show();
						$(".content .title_bcc").show();
						$(".content .bcc").empty().append(bcc_info);
					}
					else
					{
						$(".content .bcc").hide();
						$(".content .title_bcc").hide();
					}
					
					if(price != "")
					{
						$(".content .price").show();
						$(".content .title_price").show();
						$(".content .price").empty().append(price);
					}
					else
					{
						$(".content .price").hide();
						$(".content .title_price").hide();
					}
					
					$(".content .adres").empty().append(adress);
					$(".content .description").empty().append(contents);
					
					if(type == "hotel")
					{
						// add specific hotel info
					}
					else if(type == "restaurant")
					{
						
					}
					
					if(stars != "")
					{
						// add stars
					}
					
					if(telefoon != "")
					{
						$(".reserveerbutton").append('<span class="telefoonnummer">' + telefoon + '</span>').show();
						$(".reserveerbutton").attr("href", "tel:" + telefoon);
						$(".reserveerbutton").css({backgroundColor: color});
					}
					
					$(".content .addtowishlistbutton").attr("item_id", id);
					$(".content .addtowishlistbutton").attr("cat_id", cat_id);
					
					var locationinfo = "hello";
					
					var subslug = "";
					var url = "";
					
					content.getSlug(subcat_id, function(result)
					{
						subslug = result;
						url = 'http://visitbruges.be/location/' + subslug + '/' + slug;
						
						$(".reserveerbutton").css({backgroundColor: color});
						$(".reserveerbutton").empty().append("<span>" + t.translate("mobilewebsite") + "</span>").show();
						$(".reserveerbutton").append('<span class="telefoonnummer">' + t.translate("openbrowser") + '</span>');
						$(".reserveerbutton").attr("href", url);
						
						if(telefoon != "")
						{
							switch(parseInt(cat_id))
							{
								
								case 4:
								case 5:
									if(subcat_id == 15 )
									{
										$(".reserveerbutton").empty().append("<span>" + t.translate("reserveren") + "</span>").show();
										$(".reserveerbutton").append('<span class="telefoonnummer">' + telefoon + '</span>').show();
										$(".reserveerbutton").attr("href", "tel:" + telefoon);
									}
									else if(subcat_id == 29 )
									{
										$(".reserveerbutton").empty().append("<span>" + t.translate("reserveren") + "</span>").show();
										$(".reserveerbutton").append('<span class="telefoonnummer">' + telefoon + '</span>').show();
										$(".reserveerbutton").attr("href", "tel:" + telefoon);
									}
									else if(subcat_id == 16 )
									{
										$(".reserveerbutton").empty().append("<span>" + t.translate("contact") + "</span>").show();
										$(".reserveerbutton").append('<span class="telefoonnummer">' + telefoon + '</span>').show();
										$(".reserveerbutton").attr("href", "tel:" + telefoon);
									}
									else
									{
										$(".reserveerbutton").empty().append("<span>" + t.translate("contact") + "</span>").show();
										$(".reserveerbutton").append('<span class="telefoonnummer">' + t.translate("openbrowser") + '</span>');
									}
									
								break;
								
							}
							$(".reserveerbutton span").addClass("white");
						}
						
					});
					
					$(".content .addtowishlistbutton").attr("item_id", id);
					$(".content .addtowishlistbutton").attr("cat_id", cat_id);
					
					var locationinfo = "hello";
					
					
					$(".content .sharebutton").unbind("click").click(function()
					{

						navigator.notification.confirm(
					        "", // message
					        shareThisLocation,    // callback to invoke with index of button pressed
					        t.translate("delen"), // title
					        t.translate("twitter") + "," + t.translate("sluiten") // buttonLabels
					    );
						
					})
					
					function shareThisLocation(buttonIndex)
					{

						var url = 'http://www.visitbruges.be/locatie/' + subslug + '/' + slug;
						var text = title + ' - http://www.visitbruges.be/locatie/' + subslug + '/' + slug + ' via @Visit_Bruges';
						
						switch(buttonIndex)
						{
							case 1:
								// share op twitter
								var uri = "http://twitter.com/share?status=1&text=" + text;
							    window.open(uri);
							    
							break;
							/*case 2:
								// share op facebook
								var uri = "http://m.facebook.com/sharer.php?u"+ url;
								uri = encodeURI(uri);
								window.open(uri);
							break;*/
						}
					}

					
					var marker = new Object;
					
					marker.id = id;
					marker.title = title;
					marker.lat = lat;
					marker.lng = lng;
					marker.category = cat_id;
					marker.openinghours = "";
	
					markers.push(marker);
					
					setTimeout(function()
					{
						$("#subMapButton").removeClass("hidden");
						
					},500)

				
					$("#subMapButton").unbind("click").click(function(e)
					{
						
						var con = getConnection();
					
						if(con == "bad")
						{
							navigator.notification.alert(t.translate("m_desc"), function(){}, t.translate("m_no"), 'Ok');
						}
						else
						{
							if($submaptoggle == false)
							{
	
								$(".page_location .content").hide();
								$(".page_location #locationmap").show();
								$(".pointer").css({
									backgroundImage: "url(img/contentbutton.png)",
									'background-size': "50%"
								})
								var map = new Map();
								map.createMap("locationmap", markers);
								$submaptoggle = true;
					
							}
							else if($submaptoggle == true)
							{
	
								$(".page_location .content").show();
								$(".page_location #locationmap").hide();
								$(".pointer").css({
									backgroundImage: "url(img/mapbutton.png)",
									'background-size': "35%"
								})
								$submaptoggle = false;
							}
						}
						
					})

				})
				
			}
			
			$("#wrapper_location").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_location").height($(".scrollable_location").height() + 60);
			myScroll_location.refresh();
			myScroll_location.scrollTo(0,0);

		break;
		
		case("page_wishlist"):
		
			updateHistory("page_home");
			updateCurrentPage("page_wishlist");
			
			var wishlistitems = results.rows.length;
			
			// clear template
			$(".page_wishlist .list").empty();
			$(".page_wishlist .emptywishlist").hide();
			$(".page_wishlist .emptywishlist .note").empty().append(t.translate("wishlistleeg"));
			
			if(wishlistitems < 1)
			{
				$(".page_wishlist .emptywishlist").show();
			}
			else
			{
				content.showWishlist(results, function(id, title, colorClass, iconClass, item, position, category)
				{
					$(".page_wishlist .list").append(item);
					$(".page_wishlist .list .item .deletebutton").hide();
				})
			}


			$(".page_wishlist .list li").bind('tap', function(e)
			{
				
				if(!$(this).hasClass("unclickable"))
				{
					var content_id = $(this).attr("id");
					var category_id = $(this).attr("topcat");
					var content_type = "page_location";
					
					content.defineContent(content_type, content_id, function(results)
					{
						updateHistory("page_wishlist");
						navigateTo(content_type, category_id, results);
						
					});
				}
				
			})
			
			$(".page_wishlist .list li").live('swipeleft', function(e)
			{ 
				$this = $(this);
				var deleteid = $this.attr("id");
				$this.children(".deletebutton").fadeIn();
				$this.addClass("unclickable");
				$this.children(".deletebutton").unbind("click").click(function(e)
				{
					content.removeFromWishlist(deleteid, function(result)
					{
						if(result == true)
						{
							$this.fadeOut(800, function()
							{
								$this.remove();
							})
						}
					})
					
					wishlistitems --;
					
					if (wishlistitems == 0)
					{
						$(".page_wishlist .emptywishlist").delay(1000).fadeIn();
					}
					
				})
				
			})
			
			$(".page_wishlist .list li").live('swiperight', function(e)
			{ 
				$(this).removeClass("unclickable");
				$(this).children(".deletebutton").fadeOut();
			})
			
			$("#wrapper_wishlist").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_wishlist").height($(".scrollable_wishlist").height());
			myScroll_wishlist.refresh();
			myScroll_wishlist.scrollTo(0,0);

		break;
		
		case("page_lunchdeals"):

			updateHistory("page_home");
			updateCurrentPage("page_lunchdeals");

			// reset views
			$maptoggle = false;
			$(".page_lunchdeals .list").removeClass("hidden");
		
			if(results)
			{
				
				// clear template
				$(".page_lunchdeals .list").empty();

				content.createPageWithLunchdeals(cat_id, results, function(id, item, lat, lng, stars)
				{
					
					$(".page_lunchdeals .list").append(item);

					$(".page_lunchdeals .list .item[id=" + id + "] .stars").css({
						width: 72	
					})
					
					var orange = window.localStorage.getItem("pink");

				})

				$(".page_lunchdeals .list li").bind('tap', function(e)
				{
					var content_id = $(this).attr("id");
					var category_id = 20;
					var content_type = "page_location";
					
					content.defineContent(content_type, content_id, function(results)
					{
						updateHistory("page_lunchdeals");
						navigateTo(content_type, category_id, results);
					});
					
				})
				
			}
			
			$("#wrapper_lunchdeals").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_lunchdeals").height($(".scrollable_lunchdeals").height());
			myScroll_lunchdeals.refresh();
			myScroll_lunchdeals.scrollTo(0,0);

		break;

		case("page_weather"):

			var weather = new Weather();
			weather.show();
			
		break;
		
		case("page_mylocations"):
		
			var map = new Map();

			//$(".mymarkerinfo").hide();
			//$(".mylocationsinfo").hide();
		
			$(".addlocationinput").hide();
			var buttonToggle = false;
			
			$(".addlocationbutton").css({
				backgroundImage: "url(img/addlocationbutton.png)",
				backgroundColor: "#101010"
			});
			
			$(".mylocationsinfo p").empty().append(t.translate("voeglocatietoe"));
		
			$(".addlocationinput").attr("value", t.translate("locatieomschr"));

			// haal alle personal locaties op + plaats pointers op map
			// voeg een locatie toe
			map.createMap("mylocationsmap", null);
			
			$(".addlocationinput").focus(function(e)
			{
				$(".addlocationinput").attr("value", "");
			})
			
			$(".addlocationinput").focusout(function(e)
			{
				if($(".addlocationinput").attr("value") == "")
				{
					$(".addlocationinput").attr("value", t.translate("locatieomschr"));
				}
				
			})
			
			var clear = {action:'clear', name:'marker'};
			$("#mylocationsmap").gmap3(clear);
			
			content.getMyLocations(function(result, id, description, lat, lng)
			{
				if(result == true)
				{
					map.addMarker("#mylocationsmap", id, description, lat, lng, null, null);
				}
				else if(result == false)
				{
					// show guides
					setTimeout(function()
					{
						$(".mylocationsinfo").removeClass("myli_down");
					}, 800)
					
			
				}
			})
			
			$(".addlocationbutton").unbind("click").click(function(e)
			{
				
				if(buttonToggle == true)
				{
					
					var description = $(".addlocationinput").attr("value");
					
					getPosition(function(result, position)
					{
						if(result == true)
						{
							
							if(description != "")
							{
								
								$(".addlocationbutton").css({
									backgroundImage: "url(img/addlocationbutton.png)",
									backgroundColor: "#101010"
								});
								$(".addlocationinput").hide();
								$(".addlocationinput").attr("value", t.translate("locatieomschr"));
								
								var lat = position.lat;
								var lng = position.lng;
								content.addLocation(description, lat, lng, function(insertId)
								{
	
									map.dropMarker(insertId, description, lat, lng);
									buttonToggle = false;
									setTimeout(function()
									{
										$(".mylocationsinfo").addClass("myli_down");
										
									}, 200)
									
								})
							}
							else
							{
								navigator.notification.alert(
								    t.translate("geenlocatieomschr"),  	// message
								    alertDismissed,         			// callback
								    '',             					// title
								    t.translate("ok")                  	// buttonName
								);
							}
						}
						else
						{
							navigator.notification.alert(
							    t.translate("geenlocatie"),  	// message
							    alertDismissed,         			// callback
							    '',             					// title
							    t.translate("ok")                  	// buttonName
							);
						}
					});
					
				}
				else
				{
					$(".addlocationinput").show();
					
					$(".addlocationbutton").css({
						backgroundImage: "url(img/addbutton.png)",
						backgroundColor: "#91cbe1"
					});
					buttonToggle = true;
				}

			})
			
			$(".mymarkerinfo .closelocationbutton").unbind("click").click(function(e)
			{

				$(".mymarkerinfo").addClass("mymarkerinfo_down");
			})
			
			$(".mymarkerinfo .deletelocationbutton").unbind("click").click(function(e)
			{
				var deleteid = $(".mymarkerinfo .deletelocationbutton").attr("id");
				deleteid = parseInt(deleteid);
				content.removeLocation(deleteid, function callback()
				{
					// remove marker
					//var clear = {action:'clear', name:'marker', tag:deleteid};
					$('#mylocationsmap').gmap3({clear:{tag:deleteid}});
					$(".mymarkerinfo").addClass("mymarkerinfo_down");
				})
				
			})
			
		break;
		
		case("page_heritagewalk"):
		
			updateHistory("page_home");
			updateCurrentPage("page_heritagewalk");
		
			$(".heritagewalkstart").show();
			$(".heritagewalklist").hide();
			$(".heritagewalkinfo").hide();
			$(".heritagewalkend").hide();
			$(".heritagewalkmap").hide();
			$(".h_sub_info").hide();
		
			$(".h_info").empty().append(t.translate("h_info"));
			$(".h_startbutton span").empty().append(t.translate("h_start"));
			$(".h_subinfo").empty().append(t.translate("h_startinfo"));
			
			$("#wrapper_heritagewalk").css({
				height: window.innerHeight - 60,
				width: window.innerWidth
			});
			
			$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height());
			myScroll_heritagewalk.refresh();
			myScroll_heritagewalk.scrollTo(0,0);
			
			$(".h_startbutton").unbind("click").click(function(e)
			{
				
				var con = getConnection();
				if(con != "bad")
				{
					navigator.notification.confirm(
					    t.translate("h_optformaps"),  	// message
					    optForGoogleMaps,         			// callback
					    '',             					// title
					    t.translate("h_optyes") + ',' + t.translate("h_optno")                 	// buttonName
					);
				}
				else
				{
					window.localStorage.setItem("heritagewalk", "offlinemaps");
					showStartingPoints();
				}
				
				function optForGoogleMaps(buttonIndex)
				{
					
					if(buttonIndex == 1)
					{
						// google maps
						window.localStorage.setItem("heritagewalk", "googlemaps");
						showStartingPoints();
					}
					else if(buttonIndex == 2)
					{
						// offline maps
						window.localStorage.setItem("heritagewalk", "offlinemaps");
						showStartingPoints();	
					}
					
				}
				
				// toon alle mogelijke startpunten, zowel offline als online
				
				function showStartingPoints()
				{
					$(".page_heritagewalk .h_locationslist").empty();
					$(".heritagewalkstart").hide();
					$(".heritagewalklist").show();
					$(".heritagewalkinfo").hide();
					$(".heritagewalkend").hide();
					$(".heritagewalkmap").hide();
					$(".h_sub_info").hide();
					$(".h_closestlocationtitle").hide();
					$(".h_closestlocation").hide();
					$(".h_otherlocationstitle").hide();
					
					heritagewalk.getLocations(function(results)
					{
						$(".heritagewalklist h5").empty().append(t.translate("h_kieshalte"));
							
						// show locations
						heritagewalk.showLocations(cat_id, results, null, function(id, title, colorClass, iconClass, item, lat, lng, category, openinghours)
						{
							$(".h_otherlocations").append(item);
							$(".h_otherlocations li").unbind("click").click(function()
							{
								var startId = parseInt($(this).attr("id"));
								nextLocation(startId);
							})
							
							$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height() + 80);
							myScroll_heritagewalk.refresh();
							myScroll_heritagewalk.scrollTo(0,0);
							
						})
						
						// show nearest location
						if(window.localStorage.getItem("heritagewalk") == "googlemaps")
						{
							
							$(".h_closestlocationtitle").empty().append(t.translate("h_dichtstehalte"));
							$(".h_otherlocationstitle").empty().append(t.translate("h_anderehaltes"));
							
							heritagewalk.findNearestLocation(function(id, item)
							{
								
								heritagewalk.showLocations(cat_id, results, id, function(id, title, colorClass, iconClass, item, lat, lng, category, openinghours)
								{
									$(".h_closestlocation").empty().append(item);
									
									$(".h_closestlocationtitle").show();
									$(".h_closestlocation").show();
									$(".h_otherlocationstitle").show();
									
									$(".h_closestlocation li").unbind("click").click(function()
									{
										var startId = parseInt($(this).attr("id"));
										nextLocation(startId);
									})
								})
							})
						}
						
					})
					
				}
			})
			
			$(".h_arrivedbutton").unbind("click").click(function(e)
			{
				
				$(".h_nav_infobutton span").empty().append(t.translate("h_infobutton"));
				$(".h_nav_fotobutton span").empty().append(t.translate("h_fotobutton"));
				$(".h_nav_videobutton span").empty().append(t.translate("h_videobutton"));
				$(".h_nav_nextbutton span").empty().append(t.translate("h_volgendebutton"));
				
				$(".heritagewalkstart").hide();
				$(".heritagewalkinfo").show();
				$(".heritagewalkend").hide();
				$(".heritagewalkmap").hide();
				$(".heritagewalkmapinfo").hide();
				$(".h_sub_info").hide();
				$(".h_fotoscreen").show();
				$(".h_subnavigation").show();
				$(".h_subnavigation").css({
					display: 'block'
				})
				
				$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height());
				myScroll_heritagewalk.refresh();
				myScroll_heritagewalk.scrollTo(0,0);
			})
			
			$(".h_nav_infobutton").unbind("click").click(function(e)
			{

				$(".h_infoscreen").show();
				$(".h_fotoscreen").hide();
				$(".h_videoscreen").hide();
				
				$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height() + 80);
				myScroll_heritagewalk.refresh();
				myScroll_heritagewalk.scrollTo(0,0);
				
			})
			
			$(".h_nav_fotobutton").unbind("click").click(function(e)
			{
				
				$(".h_infoscreen").hide();
				$(".h_fotoscreen").show();
				$(".h_videoscreen").hide();
				
				$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height());
				myScroll_heritagewalk.refresh();
				myScroll_heritagewalk.scrollTo(0,0);
			})
			
			function nextLocation(startId)
			{

				heritagewalk.next(startId, function(location, type)
				{
					
					// alert("show location > " + location["id"]);
					
					if(type == "last")
					{

						$(".heritagewalkend p").empty().append(t.translate("h_einde"));
						$(".h_nav_nextbutton").unbind("click").click(function(e)
						{
							$(".heritagewalkstart").hide();
							$(".heritagewalklist").hide();
							$(".heritagewalkinfo").hide();
							$(".heritagewalkend").show();
							$(".heritagewalkmap").hide();
							$(".heritagewalkmapinfo").hide();
							$(".h_sub_info").hide();
							$(".h_infoscreen").hide();
							$(".h_subnavigation").hide();
						})
						
					}
					else
					{
						$(".h_nav_nextbutton").unbind("click").click(function(e)
						{
							nextLocation(null);
						})
						
						$(".heritagewalkstart").hide();
						$(".heritagewalklist").hide();
						$(".heritagewalkinfo").hide();
						$(".heritagewalkend").hide();
						$(".heritagewalkmap").show();
						$(".heritagewalkmapinfo").show();
						$(".h_subnavigation").hide();
						
						$(".heritagewalkmapinfo .h_nextlocationinfo").empty().append(t.translate("h_volgendelocatie"));
						$(".heritagewalkmapinfo .h_arrivedbutton span").empty().append(t.translate("h_ikbener"));
						
						var title = location["title"];
						
						if(title.length > 20)
						{
							title = title.substring(0, 18) + "...";
						}
						
						var video = location["video"];
						if(video != "")
						{
							
							$(".h_nav_videobutton").css({
								visibility: 'visible'
							})
							
							// video

							$(".h_nav_videobutton").unbind("click").click(function(e)
							{
								
								window.plugins.videoPlayer.play("file:///android_asset/www/RESOURCES/" + video);
								
								$("#scroller_heritagewalk").height($(".scrollable_heritagewalk").height());
								myScroll_heritagewalk.refresh();
								myScroll_heritagewalk.scrollTo(0,0);

							})
						}
						else
						{
							// no video
							$(".h_nav_videobutton").css({
								visibility: 'hidden'
							})
						}
						
						$(".heritagewalkmapinfo .h_nextlocation").empty().append(title);
						$(".heritagewalkinfo .h_infoscreen h5").empty().append(location["title"]);
						$(".heritagewalkinfo .h_infoscreen span").empty().append(location["description"]);
						
						$(".h_fotoscreen").empty();
						
						var fotos = location["fotos"];

						_fotos = fotos.split(" ");
						for(var i = 0; i < _fotos.length; i++)
						{
							var newsize = parseInt(window.innerWidth - 40);
							$(".h_fotoscreen").append('<img class="locationimage" src="RESOURCES/' + _fotos[i] + '" />');
							$(".locationimage").css({
								width: newsize,
								height: newsize
							});
						}
						
						if(window.localStorage.getItem("heritagewalk") == "googlemaps")
						{
							$(".h_offlinemaps").hide();
							$(".h_onlinemaps").show();
							var marker = new Object;
							marker.id = location["id"];
							marker.title = location["title"];
							marker.lat = location["lat"];
							marker.lng = location["lng"];
							marker.category = 1;
							marker.openinghours = "";
							
							var map = new Map();
							map.createMap("heritagewalkmap_online", [marker]);
						}
						else
						{
							
							$(".h_offlinemaps").show();
							$(".h_onlinemaps").hide();
							
							if(startId != null)
							{
								$(".h_offlinemaps").css({
									backgroundImage: 'url(HERITAGEMAPS/first/' + location["id"] + '.jpg)'
								})
							}
							else
							{
								$(".h_offlinemaps").css({
									backgroundImage: 'url(HERITAGEMAPS/locaties/' + location["id"] + '.jpg)'
								})
							}
							
							
							
						}
						
					}

				});
			}
			
		break;
		
	}
}


function updateCurrentPage(page)
{
	window.localStorage.setItem("currentpage", page);
}

function updateHistory(page)
{
	
	window.localStorage.setItem("history", page);
	
	if(window.localStorage.getItem("history") == "")
	{
		$("#subheader .toggleNavButton").delay(300).show();
		$("#subheader .backButton").hide();
	}
	else
	{
		$("#subheader .toggleNavButton").hide();
		$("#subheader .backButton").show();
	}
}

/*
 * openSubheader
 * opens subheader
 */

function openSubheader(title, color)
{
	
	if(title)
	{
		if(title.length > 24)
		{
			title = title.substring(0, 22) + "...";
		}
		
		$(".pagetitle").text(title);
	}
	
	if(color)
	{
		$("#subheader").css({
			"background-color": color
		}, '800')
	}

	
	
	
	if(!$("#mainheader").hasClass("up"))
	{
		$("#mainheader").addClass("up");
	}

}

/*
 * closeSubheader
 * closes subheader
 */

function closeSubheader()
{
	$("#mainheader").removeClass("up");
}

/*
 * changeSubheader
 * changes subheader color & text
 */

function changeSubheader(title, color)
{
	if(title.length > 24)
	{
		title = title.substring(0, 22) + "...";
	}
	
	$(".pagetitle").text(title);
	
	$("#subheader").css({
		"background-color": color
	}, 800)
	
}


/*
 * openNavigation
 * sidebar slides in
 */

function openNavigation()
{
	$navtoggle = true;
	$("#headMapButton").addClass("hidden");
	$("#subMapButton").addClass("hidden");
	$("#mainheader").addClass("withnavigation");
	$(".sidebar").addClass("sidebar_active");
	$(".pages").addClass("with_sidebar_active");
}

/*
 * closeNavigation
 * sidebar slides out
 */

function closeNavigation()
{
	
	$navtoggle = false;
	
	if(window.localStorage.getItem("currentpage") == "page_sub" || window.localStorage.getItem("currentpage") == "page_cat" || window.localStorage.getItem("currentpage") == "page_all")
	{
		setTimeout(function()
		{
			$("#headMapButton").removeClass("hidden");
			
		}, 500)
		
	}
	else if(window.localStorage.getItem("currentpage") == "page_location")
	{
		setTimeout(function()
		{
			$("#subMapButton").removeClass("hidden");
			
		}, 500)
	}
	
	$("#mainheader").removeClass("withnavigation");
	$(".sidebar").removeClass("sidebar_active");
	$(".pages").removeClass("with_sidebar_active");
	
}

function getConnection()
{
	
	var networkState = navigator.network.connection.type;
	
    var states = {};
    
    states[Connection.UNKNOWN]  = 'bad';
    states[Connection.ETHERNET] = 'wifi';
    states[Connection.WIFI]     = 'wifi';
    states[Connection.CELL_2G]  = 'cell';
    states[Connection.CELL_3G]  = 'cell';
    states[Connection.CELL_4G]  = 'cell';
    states[Connection.NONE]     = 'bad';

    return states[networkState];
}

function getPosition(callback)
{
	
	navigator.geolocation.getCurrentPosition(function(position)
	{
		
		// success
		var lat = position.coords.latitude;
		var lng = position.coords.longitude;
		var latlng = new Object();
		latlng.lat = lat;
		latlng.lng = lng;
		callback(true, latlng);
		
		
	}, function(error)
	{
		callback(false, null);	
	});
                                     
}

function alertDismissed()
{
	
}
