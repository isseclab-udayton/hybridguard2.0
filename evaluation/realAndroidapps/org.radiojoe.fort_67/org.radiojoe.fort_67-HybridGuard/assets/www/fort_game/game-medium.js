//----------------------------
//Event Randomization Function
//----------------------------
function rand(num) {
	return Math.floor(Math.random() * num) + 1;
}


//----------------------------
//Start of Game Function - Used to begin the game
//----------------------------
function StartGame () {
	//Change background to house of player
	document.getElementById("game_background").src = "images/640x960/backgrounds/house.jpg";
	
	//Remove start button, replace with go to work and catalogue buttons
	document.getElementById("work_button").style.display = "inline";
	document.getElementById("start_button").style.display = "none";
	document.getElementById("purchase_button").style.display = "inline";
	
	//Explanatory text for first time users
	document.getElementById("gametext").innerHTML="Visit the Hudson Bay Company&#39;s Sale Shop to purchase things you need to survive. Physical money was rare, so to get yourself started, you established a line of credit at the company&#39;s store based on your salary rate. You only get paid once a year, so be wise about what you purchase. A trade blanket would really help during those cold nights!";

	//Update Game Variable Displays
	DisplayVariables();
	
	//Update Game Season Image Displays
	DisplaySeasons();	
	
	
	ShowItems();
}


//----------------------------
//Function for Go To Work button - Changes out background image, hides button and items
//----------------------------
function GoToWork() {
	//Change background, hide "Go To Work" and "Catalogue" buttons, show "Go Home" button
	document.getElementById("game_background").src = "images/640x960/backgrounds/work_background.jpg";
	document.getElementById("work_button").style.display = "none";
	document.getElementById("purchase_button").style.display = "none";
	
	//Hides all items so they don't display on work screen
	HideItems();
	
	//Randomize the item for the player to make
	current_work_item = document.getElementById("work_item");
	current_work_item.firstChild.nodeValue = rand(3);
	
	//Show the first selector so that the player can start working
	document.getElementById("selector1").style.visibility = "visible";
	
	//Show text to prompt the player
	if (current_work_item.firstChild.nodeValue == 1) {
		document.getElementById("gametext").innerHTML="To start your work, forge pieces of a building hinge from iron stock by tapping the fire of the kiln. Right after heating the hinge, a sizing pin is driven through the round hole, known as the gudgeon.";
	}
	if (current_work_item.firstChild.nodeValue == 2) {
		document.getElementById("gametext").innerHTML="To begin your work on some nails, heat the iron stock in the fire of the kiln. When crafting nails or any long item, blacksmiths needed to draw out the metal by hitting it on all four sides repeatedly. This lengthens the metal.";
	}
	if (current_work_item.firstChild.nodeValue == 3) {
		document.getElementById("gametext").innerHTML="To begin work, forge pieces of a beaver trap in the fire of the kiln. The beaver traps are made from an iron bar stock shipped overseas from England.";
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
	//Update Game Season Image Displays
	DisplaySeasons();

}


//----------------------------
//Function for Fire - Used when the player goes to work
//----------------------------
function FireKiln() {
	//Hide the first selector
	document.getElementById("selector1").style.visibility = "hidden";
	
	//Plays the sound for the kiln sequence
	//var sound = document.getElementById("sound_fire");
	//sound.Play();
        PlayKiln();
	
	setTimeout("FireKilnDelay()", 2000);

}

function PlayKiln()
{
    var embed=document.createElement('object');
    embed.setAttribute('type','audio/mp3');
    embed.setAttribute('data', 'audio/kiln_sounds.mp3');
    embed.setAttribute('autostart', true);
    embed.setAttribute('style', 'display: none');
    document.getElementsByTagName('body')[0].appendChild(embed);
}

//----------------------------
//Function for Delaying Fire - Used when the player clicks on fire
//----------------------------
function FireKilnDelay() {	
	//Show the second selector
	document.getElementById("selector2").style.visibility = "visible";
	
	//Retrieve the current item for the player to make
	current_work_item = document.getElementById("work_item");
	
	//Show text to prompt the player
	if (current_work_item.firstChild.nodeValue == 1) {
		document.getElementById("gametext").innerHTML="Next, use the hammer and anvil to shape the pieces of the hinge. The pin that allows the hinge to swing is typically called a pintle.";
	}
	if (current_work_item.firstChild.nodeValue == 2) {
		document.getElementById("gametext").innerHTML="Next, use the hammer and anvil to shape the nails. You use a pair of tongs to hold the heated metal rod as you shape it. Hitting accurately is more important than hitting hard when working in a smithy, so hold the metal steady!";
	}
	if (current_work_item.firstChild.nodeValue == 3) {
		document.getElementById("gametext").innerHTML="Next, use the hammer and anvil to shape the pieces. Beaver traps are a big focus of your trade as a blacksmith, and you spend many days creating these items in the smithy.";
	}


	
}


//----------------------------
//Function for Hammer - Used when the player goes to work
//----------------------------
function HammerAnvil() {
	//Hide the second selector
	document.getElementById("selector2").style.visibility = "hidden";
	
	//Plays the sound for the hammer sequence
	//var sound = document.getElementById("sound_hammer");
	//sound.Play();
        PlayHammer();
	
	setTimeout("HammerAnvilDelay()", 2000);
	
}

function PlayHammer()
{
    var embed=document.createElement('object');
    embed.setAttribute('type','audio/mp3');
    embed.setAttribute('data', 'audio/hammering_sounds.mp3');
    embed.setAttribute('autostart', true);
    embed.setAttribute('style', 'display: none');
    document.getElementsByTagName('body')[0].appendChild(embed);
}

//----------------------------
//Function for Delaying Hammer - Used when the player clicks on hammer
//----------------------------
function HammerAnvilDelay() {	
	//Show the third selector
	document.getElementById("selector3").style.visibility = "visible";
	
	//Retrieve the current item for the player to make
	current_work_item = document.getElementById("work_item");
	
	//Show text to prompt the player
	if (current_work_item.firstChild.nodeValue == 1) {
		document.getElementById("gametext").innerHTML="Now refine the pieces of the hinge on the grinder to finish your work and see what happened during this season.";
	}
	if (current_work_item.firstChild.nodeValue == 2) {
		document.getElementById("gametext").innerHTML="Now sharpen and refine the nails on the grinder to finish your work and see what happened during this season.";
	}
	if (current_work_item.firstChild.nodeValue == 3) {
		document.getElementById("gametext").innerHTML="Now sharpen and refine the trap pieces on the grinder to finish your work and see what happened during this season.";
	}


}


//----------------------------
//Function for Grinder - Used when the player goes to work
//----------------------------
function WorkDone() {
	//Hide the third selector
	document.getElementById("selector3").style.visibility = "hidden";

	//Plays the sound for the grinder sequence
	//var sound = document.getElementById("sound_grinder");
	//sound.Play();
        PlayGrinder();
	
	setTimeout("WorkDoneDelay()", 2000);

}

function PlayGrinder()
{
    var embed=document.createElement('object');
    embed.setAttribute('type','audio/mp3');
    embed.setAttribute('data', 'audio/grinding_sounds.mp3');
    embed.setAttribute('autostart', true);
    embed.setAttribute('style', 'display: none');
    document.getElementsByTagName('body')[0].appendChild(embed);
}

//----------------------------
//Function for Delaying Grinder - Used when the player clicks on grinder
//----------------------------
function WorkDoneDelay() {	
	//Displays the button for going home
	document.getElementById("home_button").style.display = "inline";

	//Calls function to determine which event is encountered
	seasonal_event();
}


//----------------------------
//Function for Go Home button - Changes out the background image and hides button
//----------------------------
function GoHome() {
	//Change background, hide "Go Home" button, show "Go To Work" and "Catalogue" buttons
	document.getElementById("game_background").src = "images/640x960/backgrounds/house.jpg";
	document.getElementById("work_button").style.display = "inline";
	document.getElementById("home_button").style.display = "none";
	document.getElementById("purchase_button").style.display = "inline";

	//If items have been bought, display them	
	ShowItems();
	
	//Clear the text from the box
	document.getElementById("gametext").innerHTML="";
	
	//Increases season by one by targeting "current_season" div and modifying value
	season = document.getElementById("current_season");
	season.firstChild.nodeValue++;
	
	//If one year has passed, give player their yearly pay
	payCheck ();
	
	//Checks to see if the game has ended. If so, call the endGame function
	if (season.firstChild.nodeValue == 21) {
		endGame ();
	}

	//Update Game Variable Displays
	DisplayVariables();
	
	//Update Game Season Image Displays
	DisplaySeasons();

}


//----------------------------
//Function for Yes Button - Used when an event asks the player to make a choice
//----------------------------
function ChooseYes() {
	//Target "last_event" div, retrieve value, and store in "event" variable
	event = document.getElementById("last_event");
	
	//Target "yearly_pay" div and retrieve value for editing
	pay = document.getElementById("yearly_pay");
	
	//Keeps track of yes and no choice
	yes = document.getElementById("yes_choice");
	yes.firstChild.nodeValue = 1;
	no = document.getElementById("no_choice");
	no.firstChild.nodeValue = 0;
	
	//Target "money" div, retrieve value, store in "money" variable, and create temporary integer "temp_money"
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Target "family_happiness" div and retrieve the value
	happy = document.getElementById("family_happiness");
	
	//Checks to see which event the player said yes to
	//EVENT 1 - HAND BURNING - CHOICE
	if (event.firstChild.nodeValue == 1) {
		document.getElementById("gametext").innerHTML="Unfortunately, the item was harder to make than you thought, and you burned your hand in the kiln. One of the blacksmiths salvaged the piece, but you still need to visit the doctor in order to treat your burned hand. Your work suffers from your injury, and the company deducts one pound from your wages this year.";
		temp_money--;
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 40;
		
		//Alters the happiness of the family
		happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
	}
	
	//EVENT 2 - BUYING A DOLL - CHOICE
	if (event.firstChild.nodeValue == 2) {
		document.getElementById("gametext").innerHTML="To appease your daughter, you spend two credits buying her a doll. Though it doesn&#39;t seem to do much at first, your daughter eventually calms down and occupies herself with her new toy.";
		temp_money = temp_money - 2;
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 50;
		
		//Alters the happiness of the family
		happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
	}

	//EVENT 6 - SPECIAL ORDER - CHOICE
	if (event.firstChild.nodeValue == 6) {
		document.getElementById("gametext").innerHTML="You agree to help Andr&eacute with the special order, and perform well. Andr&eacute is very proud, and you receive a bonus of one credit.";
		temp_money++;
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 50;
		
		//Changes the player's yearly pay
		pay.firstChild.nodeValue++;
	}
	
	//EVENT 12 - FRIEND IN NEED - CHOICE
	if (event.firstChild.nodeValue == 12) {
		//Checks to see if player has enough money for the comforter
		if (money.firstChild.nodeValue >= 10) {
			document.getElementById("gametext").innerHTML="Even though you know he won&#39;t pay you back, you still bought your friend some new bedding from the Sale Shop. He is deeply grateful for your kindness, and hopes that he can repay you someday.";
			temp_money = temp_money - 10;
			
			//Alters the player's current score
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 160;
			
			//Alters the happiness of the family
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You would love to help your friend but, sadly, you don&#39;t have enough credits to buy him the trade blanket. He leaves with his head hung low, but he understands.";
		}
	}
	
	//EVENT 13 - DISCOUNTED SPODE - CHOICE
	if (event.firstChild.nodeValue == 13) {
		//Checks to see if player has enough money for the Spode
		if (money.firstChild.nodeValue >= 21) {
			//Gets the china set div and puts the value in the spode variable
			spode = document.getElementById("i-spode_china_set");
			document.getElementById("gametext").innerHTML="Though costly, you buy the Spode from your friend. The new fine china makes your family appear more respectable in the eyes of the villagers, even though you don&#39;t use it very often.";
			temp_money = temp_money - 21;
			spode.firstChild.nodeValue++;
			
			//Alters the player's current score
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 600;
			
			//Alters the happiness of the family
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="Though you told them that you&#39;d like to buy the Spode, you realize quickly that you don&#39;t have enough credits. You apologize for wasting their time.";
		}
	}
	
	//EVENT 16 - BLACKSMITH DEATH - CHOICE
	if (event.firstChild.nodeValue == 16) {
		document.getElementById("gametext").innerHTML="You believe that you are ready for the position, but bringing it up with Andr&eacute starts an argument. The two of you bicker and fight, and you ultimately create tension between you and your boss while achieving nothing.";
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 30;
		
		//Changes the player's yearly pay
		pay.firstChild.nodeValue--;
	}
	
	//EVENT 19 - BROKEN TOOL - CHOICE
	if (event.firstChild.nodeValue == 19) {
		document.getElementById("gametext").innerHTML="You take several hours out of your work day to repair the tool. You work extra hard afterwards to make up for the lost time, and you just barely make your quota before the end of the day. The tool seems incredibly solid now, however.";
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 40;
		
		//Changes the player's yearly pay
		pay.firstChild.nodeValue++;
	}
	
	//EVENT 21 - TRADING SHIP - CHOICE
	if (event.firstChild.nodeValue == 21) {
		document.getElementById("gametext").innerHTML="Without hesitation, you ask Andr&eacute if you can help with the repair of the ship. He allows you to help, and you spend the season making nails. Grateful for your hard work, the trade ship captain makes sure you receive an extra credit from the company.";
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 50;
		
		//Changes the player's yearly pay
		pay.firstChild.nodeValue++;
	}
	
	//EVENT 22 - RUG TRADE - CHOICE
	if (event.firstChild.nodeValue == 22) {
			//Gets the rug div and puts the value in the rug variable
			rug = document.getElementById("i-rug");
			document.getElementById("gametext").innerHTML="Against your wife&#39;s wishes, you willingly accept the trade. The man continues on his way, and you are very content with your rug. Among the rest of the villagers, it brings you esteem and an improved social standing.";
			rug.firstChild.nodeValue++;
			
			//Gets rid of the player's cast iron pot
			pot = document.getElementById("i-cast_iron_pot");
			pot.firstChild.nodeValue--;
			
			//Resets catalogue text
			document.getElementById("p-pot1").firstChild.nodeValue="Cast Iron Pot";
			document.getElementById("p-pot1").style.color="black";
			document.getElementById("p-pot2").firstChild.nodeValue="6";
			
			//Alters the player's current score
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 400;
	}
	
	
	//Assign new money total to money div
	money.firstChild.nodeValue = temp_money;
	
	//Gets rid of choice buttons and shows the home button, allowing the player to end the event
	document.getElementById("home_button").style.display = "inline";
	document.getElementById("yes_button").style.display = "none";
	document.getElementById("no_button").style.display = "none";

}


//----------------------------
//Function for No Button - Used when an event asks the player to make a choice
//----------------------------
function ChooseNo() {
	//Target "last_event" div, retrieve value, and store in "event" variable
	event = document.getElementById("last_event");
	
	//Keeps track of yes and no choice
	yes = document.getElementById("yes_choice");
	yes.firstChild.nodeValue = 0;
	no = document.getElementById("no_choice");
	no.firstChild.nodeValue = 1;
	
	//Target "money" div, retrieve value, store in "money" variable, and create temporary integer "temp_money"
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Target "family_happiness" div and retrieve the value
	happy = document.getElementById("family_happiness");
	
	
	//Checks to see which event the player said no to
	//EVENT 1 - HAND BURNING - CHOICE
	if (event.firstChild.nodeValue == 1) {
		document.getElementById("gametext").innerHTML="While you would love to impress Andr&eacute, you do not believe you are skilled enough to make this particular item. Andr&eacute understands, and takes care of the job himself.";

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
	}
	
	//EVENT 2 - BUYING A DOLL - CHOICE
	if (event.firstChild.nodeValue == 2) {
		document.getElementById("gametext").innerHTML="Your daughter has been acting out, and discipline is the only way to teach her respect. You refuse to buy her a doll. Though it takes awhile, your daughter eventually learns to behave herself.";

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
		
		//Alters the happiness of the family
		happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
	}
	
	//EVENT 6 - SPECIAL ORDER - CHOICE
	if (event.firstChild.nodeValue == 6) {
		document.getElementById("gametext").innerHTML="Though disappointed, Andr&eacute finds another laborer to assist him with this special project. You continue to learn the blacksmith trade.";

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 20;
	}
	
	
	//EVENT 12 - FRIEND IN NEED - CHOICE
	if (event.firstChild.nodeValue == 12) {
		document.getElementById("gametext").innerHTML="You felt bad for your friend, but money is tight, and you need every credit that you earn this year. He leaves your house disappointed, and it is doubtful that he will survive the winter.";
		
		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 50;
		
		//Alters the happiness of the family
		happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
	}
	
	
	//EVENT 13 - DISCOUNTED SPODE - CHOICE
	if (event.firstChild.nodeValue == 13) {
		document.getElementById("gametext").innerHTML="Even though you would like to buy the Spode, it just isn&#39;t feasible, given the price. You reluctantly decline the offer.";
	}
	
	//EVENT 16 - BLACKSMITH DEATH - CHOICE
	if (event.firstChild.nodeValue == 16) {
		document.getElementById("gametext").innerHTML="Though you think you&#39;re ready, you understand that Andr&eacute has made his decision. You won&#39;t question him, and you say nothing about the position.";

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
	}
	
	//EVENT 19 - BROKEN TOOL - CHOICE
	if (event.firstChild.nodeValue == 19) {
		document.getElementById("gametext").innerHTML="You don&#39;t have the time to repair the tool, and continue with your work as usual. Unfortunately, the tool breaks during the day, and the company removes three credits from your pay to cover the damages.";
		temp_money = temp_money - 3;

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 40;
		
		//Alters the happiness of the family
		happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
	}
	
	//EVENT 21 - TRADING SHIP - CHOICE
	if (event.firstChild.nodeValue == 21) {
		document.getElementById("gametext").innerHTML="Making nails everyday for the season doesn&#39;t interest you, and you attend to your regular orders. At the end of the season, the trade ship is fully repaired, and it sets sail once again.";

		//Alters the player's current score
		score = document.getElementById("total_score");
		score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 10;
	}
	
	//EVENT 22 - RUG TRADE - CHOICE
	if (event.firstChild.nodeValue == 22) {
			document.getElementById("gametext").innerHTML="Though the rug is rather fetching, you cannot convince yourself to trade the cast iron pot for it. You have a family to take care of, after all, and the absence of a pot to cook in would severely hinder your wife&#39;s ability to cook.";
	}
	
	
	//Assign new money total to money div
	money.firstChild.nodeValue = temp_money;
	
	//Gets rid of choice buttons and shows the home button, allowing the player to end the event
	document.getElementById("home_button").style.display = "inline";
	document.getElementById("yes_button").style.display = "none";
	document.getElementById("no_button").style.display = "none";

}


//----------------------------
//Function for Showing All Items that have been bought from the catalogue
//----------------------------
function ShowItems() {
	//Loads the data contained in the i-divs
	ladle = document.getElementById("i-ladle");
	basin = document.getElementById("i-wash_basin");
	candlestick = document.getElementById("i-candlestick");
	jug = document.getElementById("i-jug");
	tumbler = document.getElementById("i-tin_tumbler");
	book = document.getElementById("i-book");
	pot = document.getElementById("i-cast_iron_pot");
	silverware = document.getElementById("i-silverware");
	comforter = document.getElementById("i-comforter");
	shelf = document.getElementById("i-wall_shelf");
	stool = document.getElementById("i-stool");
	chair = document.getElementById("i-chair");
	musket = document.getElementById("i-musket");
	china = document.getElementById("i-spode_china_set");
	chest = document.getElementById("i-storage_chest");
	kettle = document.getElementById("i-copper_kettle");
	horn = document.getElementById("i-powder_horn");
	bottles = document.getElementById("i-storage_bottles");
	rug = document.getElementById("i-rug");
	
	//Checks to see if items are purchased. If they are, they turn visible
	if (basin.firstChild.nodeValue == 1) {
		document.getElementById("basin").style.visibility = "visible";
	}
	
	if (book.firstChild.nodeValue == 1) {
		document.getElementById("book").style.visibility = "visible";
	}
	
	if (bottles.firstChild.nodeValue == 1) {
		document.getElementById("bottles").style.visibility = "visible";
	}
	
	if (candlestick.firstChild.nodeValue == 1) {
		document.getElementById("candlestick").style.visibility = "visible";
	}
	
	if (chest.firstChild.nodeValue == 1) {
		document.getElementById("chest").style.visibility = "visible";
	}
	
	if (chair.firstChild.nodeValue == 1) {
		document.getElementById("chair").style.visibility = "visible";
	}
	
	if (china.firstChild.nodeValue == 1) {
		document.getElementById("china1").style.visibility = "visible";
		document.getElementById("china2").style.visibility = "visible";
		document.getElementById("china3").style.visibility = "visible";
		document.getElementById("china4").style.visibility = "visible";
	}
	
	if (comforter.firstChild.nodeValue == 1) {
		document.getElementById("comforter").style.visibility = "visible";
	}
	
	if (horn.firstChild.nodeValue == 1) {
		document.getElementById("horn").style.visibility = "visible";
	}
	
	if (jug.firstChild.nodeValue == 1) {
		document.getElementById("jug").style.visibility = "visible";
	}
	
	if (kettle.firstChild.nodeValue == 1) {
		document.getElementById("kettle").style.visibility = "visible";
	}
	
	if (ladle.firstChild.nodeValue == 1) {
		document.getElementById("ladle").style.visibility = "visible";
	}
	
	if (musket.firstChild.nodeValue == 1) {
		document.getElementById("musket").style.visibility = "visible";
	}
	
	if (pot.firstChild.nodeValue == 1) {
		document.getElementById("pot").style.visibility = "visible";
	}
	
	if (rug.firstChild.nodeValue == 1) {
		document.getElementById("rug").style.visibility = "visible";
	}
	
	if (shelf.firstChild.nodeValue == 1) {
		document.getElementById("shelf").style.visibility = "visible";
	}
	
	if (silverware.firstChild.nodeValue == 1) {
		document.getElementById("silverware").style.visibility = "visible";
	}
	
	if (stool.firstChild.nodeValue == 1) {
		document.getElementById("stool").style.visibility = "visible";
	}
	
	if (tumbler.firstChild.nodeValue == 1) {
		document.getElementById("tumbler").style.visibility = "visible";
	}

}


//----------------------------
//Function for hiding all items
//----------------------------
function HideItems() {
	//Hides all items purchased from company store
	document.getElementById("ladle").style.visibility = "hidden";
	document.getElementById("basin").style.visibility = "hidden";
	document.getElementById("candlestick").style.visibility = "hidden";
	document.getElementById("jug").style.visibility = "hidden";
	document.getElementById("tumbler").style.visibility = "hidden";
	document.getElementById("book").style.visibility = "hidden";
	document.getElementById("pot").style.visibility = "hidden";
	document.getElementById("silverware").style.visibility = "hidden";
	document.getElementById("comforter").style.visibility = "hidden";
	document.getElementById("shelf").style.visibility = "hidden";
	document.getElementById("stool").style.visibility = "hidden";
	document.getElementById("chair").style.visibility = "hidden";
	document.getElementById("musket").style.visibility = "hidden";
	document.getElementById("china1").style.visibility = "hidden";
	document.getElementById("china2").style.visibility = "hidden";
	document.getElementById("china3").style.visibility = "hidden";
	document.getElementById("china4").style.visibility = "hidden";
	document.getElementById("chest").style.visibility = "hidden";
	document.getElementById("kettle").style.visibility = "hidden";
	document.getElementById("horn").style.visibility = "hidden";
	document.getElementById("bottles").style.visibility = "hidden";
	document.getElementById("rug").style.visibility = "hidden";
}


//----------------------------
//Function for Purchase Button - Opens the Catalogue
//----------------------------
function OpenCatalogue() {
	//Show the purchaseDone_button, hide the Work and Catalogue buttons
	document.getElementById("work_button").style.display = "none";
	document.getElementById("purchase_button").style.display = "none";
	document.getElementById("purchaseDone_button").style.display = "inline";
	
	//Hides all items so they don't display on work screen
	//HideItems();
	
	//Give game hint in gametext box
	document.getElementById("gametext").innerHTML="Tap one of the items to purchase it.";
	
	//Show the catalogue area
	document.getElementById("catalogue_data").style.display = "block";
	document.getElementById("catalogue_background").style.display = "block";
}


//----------------------------
//Function for PurchaseDone Button - Closes the Catalogue
//----------------------------
function CloseCatalogue() {
	//Hide the purchaseDone_button, show the Work and Catalogue buttons
	document.getElementById("work_button").style.display = "inline";
	document.getElementById("purchase_button").style.display = "inline";
	document.getElementById("purchaseDone_button").style.display = "none";
	
	//If items have been bought, display them	
	ShowItems();
	
	//Hide the catalogue area
	document.getElementById("catalogue_data").style.display = "none";
	document.getElementById("catalogue_background").style.display = "none";
	
	//Clear the gametext box
	document.getElementById("gametext").innerHTML="";
	
	//Update Game Variable Displays
	DisplayVariables();
	
	//Updates family status in "gametext" div
	familyStatus();
}


//----------------------------
//Event Functions
//----------------------------
function seasonal_event() {

	//Target "current_season" div, retrieve value, and store in "season" variable
	season = document.getElementById("current_season");
	
	//Target "money" div, retrieve value, store in "money" variable, and create temporary integer "temp_money"
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Target "last_event" div and store value in "event" variable. This is used to send the correct to the yes and no functions.
	event = document.getElementById("last_event");
	

	//Random Events Conditional - Activates if there isn't a set event during the season, like children being born.
	if (season.firstChild.nodeValue != 4 && season.firstChild.nodeValue != 8 && season.firstChild.nodeValue != 10 && season.firstChild.nodeValue != 13 && season.firstChild.nodeValue != 17 && season.firstChild.nodeValue != 20) {
		completed_event = false;
		
		//Some events can't take place until after a certain season - The While loop continues until a usable event is found
		while (completed_event == false) {
			var current_event = rand(26);
			//var current_event = 24;	//Test Events with this Variable
			
			//Retrieves the divs that check encounter events
			ev1 = document.getElementById("e1");
			ev2 = document.getElementById("e2");
			ev3 = document.getElementById("e3");
			ev4 = document.getElementById("e4");
			ev5 = document.getElementById("e5");
			ev6 = document.getElementById("e6");
			ev7 = document.getElementById("e7");
			ev8 = document.getElementById("e8");
			ev9 = document.getElementById("e9");
			ev10 = document.getElementById("e10");
			ev11 = document.getElementById("e11");
			ev12 = document.getElementById("e12");
			ev13 = document.getElementById("e13");
			ev14 = document.getElementById("e14");
			ev15 = document.getElementById("e15");
			ev16 = document.getElementById("e16");
			ev17 = document.getElementById("e17");
			ev18 = document.getElementById("e18");
			ev19 = document.getElementById("e19");
			ev20 = document.getElementById("e20");
			ev21 = document.getElementById("e21");
			ev22 = document.getElementById("e22");
			ev23 = document.getElementById("e23");
			ev24 = document.getElementById("e24");
			ev25 = document.getElementById("e25");
			ev26 = document.getElementById("e26");
			
			//Retrieves the divs that check purchases
			comforter = document.getElementById("i-comforter");
			musket = document.getElementById("i-musket");
			spode = document.getElementById("i-spode_china_set");
			pot = document.getElementById("i-cast_iron_pot");
			book = document.getElementById("i-book");
			silverware = document.getElementById("i-silverware");
			
			
			//EVENT 1 - HAND BURNING - CHOICE
			if (current_event == 1 && ev1.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="One day this season, you have the chance to try making a new piece of equipment in the kiln. It&#39;ll be tricky, of course, and you don&#39;t feel ready to take on the task. If you manage to make the item well, however, it will really impress Andr&eacute. Do you want to try&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 1;
				completed_event = true;
				ev1.firstChild.nodeValue++;
			}
			
			//EVENT 2 - BUYING A DOLL - CHOICE
			if (current_event == 2 && ev2.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4 && temp_money >= 2) {
				document.getElementById("gametext").innerHTML="Your first daughter begun to act out at home. She argues and fights with your wife openly, and pouts consistently whenever you scold her. Your wife suggests buying your daughter a doll, as she has nothing to play with. Will you buy your daughter a doll for two credits&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 2;
				completed_event = true;
				ev2.firstChild.nodeValue++;
			}
			
			//EVENT 3 - GOOD JOB
			if (current_event == 3 && ev3.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="During this season, you performed exceptionally well at work. Andr&eacute takes notice, and reports the good job to his superiors at the Hudson Bay Company. You receive an extra credit this season.";
				temp_money++;
				event.firstChild.nodeValue = 3;
				completed_event = true;
				ev3.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 20;
			}
			
			//EVENT 4 - SON SICKNESS
			if (current_event == 4 && ev4.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4 && season.firstChild.nodeValue > 13) {
				document.getElementById("gametext").innerHTML="James Jr. falls ill this season, and he needs both medicine and attention from the doctor for several weeks. Thankfully, the doctor manages to save him.";
				event.firstChild.nodeValue = 4;
				completed_event = true;
				ev4.firstChild.nodeValue++;

				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 5 - SHIPMENT DELAY
			if (current_event == 5 && ev5.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="The seas were exceptionally turbulent this season. Dangerous waters plagued the Hudson Bay Company&#39;s trade route, and a shipment of iron was delayed due to the unforeseen weather. As such, you weren&#39;t able to work much this season.";
				event.firstChild.nodeValue = 5;
				completed_event = true;
				ev5.firstChild.nodeValue++;
			}
			
			//EVENT 6 - SPECIAL ORDER - CHOICE
			if (current_event == 6 && ev6.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Andr&eacute Lachapelle was chosen to create a special order of beaver traps for a private customer of the Hudson Bay Company. Andr&eacute wants you to help. Do you want to&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 6;
				completed_event = true;
				ev6.firstChild.nodeValue++;
			}
			
			//EVENT 7 - DAUGHTER ILLNESS
			if (current_event == 7 && ev7.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Your firstborn daughter falls very ill this season. Through the help of the doctor, she was eventually able to recover, but her sickness still distracted you for most of the season.";
				event.firstChild.nodeValue = 7;
				completed_event = true;
				ev7.firstChild.nodeValue++;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 8 - WIFE'S GARDEN
			if (current_event == 8 && ev8.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Your wife has created a successful garden and, through the trading of vegetables, managed to accumulate an extra credit over the course of the season. Most women in the village had gardens, and they would supplement meals with vegetables.";
				temp_money++;
				event.firstChild.nodeValue = 8;
				completed_event = true;
				ev8.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
			}
			
			//EVENT 9 - RAINY SEASON
			if (current_event == 9 && ev9.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="It rained most of the season, and your clothes were typically soaked by the time you reached the blacksmith shop each morning. As the heat of the kiln dried your clothes each day, you found yourself rather thankful that you had chosen the blacksmith profession.";
				event.firstChild.nodeValue = 9;
				completed_event = true;
				ev9.firstChild.nodeValue++;
			}
			
			//EVENT 10 - REBELLIOUS DAUGHTER
			if (current_event == 10 && ev10.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Your firstborn daughter has become a little rebellious, and you spent most of the season at odds with her. Fathers didn&#39;t have a lot of time to spend with their families during the week.";
				event.firstChild.nodeValue = 10;
				completed_event = true;
				ev10.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 20;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 11 - NATIVE AMERICANS
			if (current_event == 11 && ev11.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="A new tribe of Native Americans began regularly visiting the fort this season. The increased amount of trade and liveliness at the Village kept everyone in high spirits.";
				event.firstChild.nodeValue = 11;
				completed_event = true;
				ev11.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
			}
			
			//EVENT 12 - FRIEND IN NEED - CHOICE
			if (current_event == 12 && ev12.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="A sick friend of yours was in debt this season, but desperately needs new bedding for himself and his wife. Since he&#39;s already sick, the deep cold of winter might prove too harsh for his frail body. However, a new trade blanket costs a hefty 10 credits. Will you buy him one&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 12;
				completed_event = true;
				ev12.firstChild.nodeValue++;
			}
			
			//EVENT 13 - DISCOUNTED SPODE - CHOICE
			if (current_event == 13 && ev13.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4 && spode.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="Someone at the village just bought a new set of Spode and, as such, they didn&#39;t need their old set. It&#39;s damaged, and they ask you if you&#39;d like to buy it at a discounted price of 21 credits. Should you buy the damaged Spode&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 13;
				completed_event = true;
				ev13.firstChild.nodeValue++;
			}
			
			//EVENT 14 - DEAD FRIEND
			if (current_event == 14 && musket.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="A good friend of yours died recently. He had sprained his ankle during a hunt when the weather turned sour, and he contracted pneumonia during his long walk back to the village. The doctor was unable to treat his symptoms completely, and he died a few weeks later. In his will, your friend left his musket to you. For most of the season, you mourned for your friend.";
				musket.firstChild.nodeValue++;
				event.firstChild.nodeValue = 14;
				completed_event = true;
				event.firstChild.nodeValue = 14;
				ev14.firstChild.nodeValue++;

				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 15 - HUNTING SEASON
			if (current_event == 15 && ev15.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4 && musket.firstChild.nodeValue == 1) {
				document.getElementById("gametext").innerHTML="During this season, you and a friend of yours went hunting periodically. You were mildly successful, thanks to your musket, and brought home some elk meat. You were unable to preserve the meat without salt, but it was still delicious while it lasted. With full stomachs, your family found themselves happier this season.";
				completed_event = true;
				ev15.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 30;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
			}
			
			//EVENT 16 - BLACKSMITH DEATH - CHOICE
			if (current_event == 16 && ev16.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="One of the blacksmiths at the Fort died from a bad case of pneumonia this season. While you have been training for the position, Andr&eacute doesn&#39;t believe you&#39;re ready yet. Even though you respect Andr&eacute, you want to say something about his decision. Should you say something&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 16;
				completed_event = true;
				ev16.firstChild.nodeValue++;
			}
			
			//EVENT 17 - UNINTERESTING SEASON
			if (current_event == 17 && ev17.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="Nothing truly happened this season. You spent your days working hard and tending to your house in the village.";
				event.firstChild.nodeValue = 17;
				completed_event = true;
				ev17.firstChild.nodeValue++;
			}
			
			//EVENT 18 - BEAR SIGHTINGS
			if (current_event == 18 && ev18.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="Last season, there was a steady increase in bear sightings. As such, there was a great demand for traps, and you spent this season making them. You received a bonus of one credit for your effort. You were very proud of yourself.";
				temp_money++;
				event.firstChild.nodeValue = 18;
				completed_event = true;
				ev18.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 20;
			}
			
			//EVENT 19 - BROKEN TOOL - CHOICE
			if (current_event == 19 && ev19.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="One day at work this season, you noticed that a tool looked damaged. Afraid that the tool might break as you use it, you wonder if you should repair it. Repairing the tool would halt your production for the day, but accidentally breaking the tool would get you in trouble. Should you repair the tool before working&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 19;
				completed_event = true;
				ev19.firstChild.nodeValue++;
			}
			
			//EVENT 20 - COLD WINTER
			if (current_event == 20 && ev20.firstChild.nodeValue == 0 && comforter.firstChild.nodeValue == 0 && (season.firstChild.nodeValue == 4 || season.firstChild.nodeValue == 8 || season.firstChild.nodeValue == 12 || season.firstChild.nodeValue == 16 || season.firstChild.nodeValue == 20)) {
				document.getElementById("gametext").innerHTML="Without a trade blanket this winter, your feet go numb. Each night, the cold nips at your body. You wake up stiff, tired, and aching from the low temperatures. Frostbite claims one of your toes, and you will never get it back.";
				event.firstChild.nodeValue = 20;
				completed_event = true;
				ev20.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 100;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 2;
			}
			
			//EVENT 21 - TRADING SHIP - CHOICE
			if (current_event == 21 && ev21.firstChild.nodeValue == 0) {
				document.getElementById("gametext").innerHTML="A trading ship docks after its big journey across the ocean. During its trek across the high seas, it was rather damaged in storms along the coast. It needs repairs, and the captain is looking for a blacksmith to forge a large batch of nails. Do you want to ask Andr&eacute for the job&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 21;
				completed_event = true;
				ev21.firstChild.nodeValue++;
			}
			
			//EVENT 22 - RUG TRADE - CHOICE
			if (current_event == 22 && ev22.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4 && pot.firstChild.nodeValue == 1) {
				document.getElementById("gametext").innerHTML="A traveling merchant stops by your house on his way through the area. The lavish rug he has catches your eye, and he says that he&#39;ll trade it for your cast iron pot. Will you accept the trade&#63;";
				document.getElementById("home_button").style.display = "none";
				document.getElementById("yes_button").style.display = "inline";
				document.getElementById("no_button").style.display = "inline";
				event.firstChild.nodeValue = 22;
				completed_event = true;
				ev22.firstChild.nodeValue++;
			}
			
			//EVENT 23 - NO CAST IRON POT
			if (current_event == 23 && ev23.firstChild.nodeValue == 0 && pot.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 8) {
				document.getElementById("gametext").innerHTML="Without a cast iron pot, your wife struggles to feed the family properly. The food she prepares is not enough for your second daughter, and she becomes weak from malnutrition. The doctor was able to treat her, but your daughter&#39;s body may never fully recover.";
				event.firstChild.nodeValue = 23;
				completed_event = true;
				ev23.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 120;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 24 - NO SILVERWARE
			if (current_event == 24 && ev24.firstChild.nodeValue == 0 && silverware.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Without silverware, your family continues to eat with their hands for every meal. Your wife is quite disappointed by your inability to provide for them.";
				event.firstChild.nodeValue = 24;
				completed_event = true;
				ev24.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 70;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 25 - NO MUSKET
			if (current_event == 25 && ev25.firstChild.nodeValue == 0 && musket.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Since you did not have a musket this season, you were unable to hunt with the other men of the Village. Your wife is quite unhappy about the lack of meat in your house, and you go to bed hungry on several nights.";
				event.firstChild.nodeValue = 25;
				completed_event = true;
				ev25.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 90;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}
			
			//EVENT 26 - NO BOOK
			if (current_event == 26 && ev26.firstChild.nodeValue == 0 && book.firstChild.nodeValue == 0 && season.firstChild.nodeValue > 4) {
				document.getElementById("gametext").innerHTML="Your firstborn daughter wants to learn to read, but she can&#39;t practice without good material. The lack of books around the house makes her restless, and she becomes defiant this season.";
				event.firstChild.nodeValue = 26;
				completed_event = true;
				ev26.firstChild.nodeValue++;
				
				//Alters the player's current score
				score = document.getElementById("total_score");
				score.firstChild.nodeValue = Number(score.firstChild.nodeValue) - 80;
				
				//Alters the Family's Happiness
				happy = document.getElementById("family_happiness");
				happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) - 1;
			}


		//Closes the While loop
		}
		

	
	//Closes the Random Event Conditional
	}


	//SET EVENT 1 - MARRIAGE
	if (season.firstChild.nodeValue == 4) {
		document.getElementById("gametext").innerHTML="This winter season, in 1836, you marry a recently widowed woman from the Village. Her last husband, a fur trader, died recently from pneumonia. The woman had a daughter with the fur trader, and you must now take care of two new family members. That&#39;s a lot of responsibility.";
	}
	
	//SET EVENT 2 - BIRTH OF DAUGHTER
	if (season.firstChild.nodeValue == 8) {
		document.getElementById("gametext").innerHTML="One year after you married, your wife bares another daughter. Though happy for your second child, you must now feed three people. Your wife will take care of the children, but it is up to you to provide for them. Don&#39;t be careless at work, and make sure to pay attention to their needs.";
	}
	
	//SET EVENT 3 - CATHOLIC PRIESTS ARRIVE
	if (season.firstChild.nodeValue == 10) {
		document.getElementById("gametext").innerHTML="Catholic priests arrive in the Village, and look down upon country marriages. You and your wife marry a second time&#8211;this time in the eyes of the church and the law.";
	}
	
	//SET EVENT 4 - BIRTH OF SON
	if (season.firstChild.nodeValue == 13) {
		document.getElementById("gametext").innerHTML="It is Spring of the year 1839, and to your delight, your wife gives birth to a boy. While your girls will eventually be married off to young men in the community, your son will carry on your family name for another generation. You name your son James Jr.";
	}
	
	//SET EVENT 5 - ANDRE THINKS OF LEAVING	
	if (season.firstChild.nodeValue == 17) {
		document.getElementById("gametext").innerHTML="It has been several years since you came to the fort, and even longer since Andr&eacute settled here. His wife has family over in Oregon, and Andr&eacute was able to secure a job over there. The two of them will be leaving the fort shortly, and he is thinking of naming you as his successor.";
	}
	
	//SET EVENT 6 - END OF GAME
	if (season.firstChild.nodeValue == 20) {
		document.getElementById("gametext").innerHTML="In Spring of 1841, Andr&eacute leaves the Fort. He has taught you for many long years, but he was more than just a teacher &#8211; he was a friend. While you will miss him deeply, you are overjoyed that you are allowed to fill his vacant position. After all your years of hard work, you&#39;re finally a full&#45;fledged blacksmith&#33;";
	}
	
	
	//Assign new money total to money div
	money.firstChild.nodeValue = temp_money;
	

//Closes the "seasonal_event" Function
}


//----------------------------
//Function for Paying Player
//----------------------------
function payCheck () {
	
	//Checks to see if player gets paid this season
	season = document.getElementById("current_season");
	
	
	if (season.firstChild.nodeValue == 5 || season.firstChild.nodeValue == 9 || season.firstChild.nodeValue == 13 || season.firstChild.nodeValue == 17) {
		
		//Gets player's current money and yearly pay before adding them together
		pay = document.getElementById("yearly_pay");
		salary = parseInt(pay.firstChild.nodeValue);
		
		money = document.getElementById("money");
		current_money = parseInt(money.firstChild.nodeValue);
		
		new_money = salary + current_money;
		money.firstChild.nodeValue = new_money;
		
	
		//Write message
		document.getElementById("gametext").innerHTML="After another year working, you have received another sum of credits to take care of your family. Spend them wisely!";
	}
	else {
		//Updates family status in "gametext" div
		familyStatus();
	}
	
}


//----------------------------
//Function for Displaying Family's Reactions to Player
//----------------------------
function familyStatus () {
	//Target "last_event" div and store value in "event" variable.
	event = document.getElementById("last_event");
	
	//Gets information about the current season
	season = document.getElementById("current_season");
	
	//Gets information about the player's current money
	money = document.getElementById("money");
	
	//Gets information for player choices
	yes = document.getElementById("yes_choice");
	no = document.getElementById("no_choice");
	
	//Gets information for family happiness
	happiness = document.getElementById("family_happiness");
	
	//Gets information from item nodes
	comforter = document.getElementById("i-comforter");
	musket = document.getElementById("i-musket");
	spode = document.getElementById("i-spode_china_set");
	pot = document.getElementById("i-cast_iron_pot");
	book = document.getElementById("i-book");
	silverware = document.getElementById("i-silverware");
	candle = document.getElementById("i-candlestick");
	
	
	//Retrieves the divs that check which messages have been encountered
	ai1 = document.getElementById("ai_flag1"); //Message about spending money while single
	ai2 = document.getElementById("ai_flag2"); //Message about hunting party when without Musket
	ai3 = document.getElementById("ai_flag3"); //Message about burning your hand in event 1
	ai4 = document.getElementById("ai_flag4"); //Message about buying a doll for your daughter in event 2
	ai5 = document.getElementById("ai_flag5"); //Message about turning down job in event 6
	ai6 = document.getElementById("ai_flag6"); //Message about daughter sickness in event 7
	ai7 = document.getElementById("ai_flag7"); //Message about daughter rebelliousness in event 10
	ai8 = document.getElementById("ai_flag8"); //Message about turning down friend in event 12
	ai9 = document.getElementById("ai_flag9"); //Message about friend death in event 14
	ai10 = document.getElementById("ai_flag10"); //Message about broken tool in event 19
	ai11 = document.getElementById("ai_flag11"); //Message about repairing the ship in event 21
	ai12 = document.getElementById("ai_flag12"); //Message about cast iron pot in event 22
	ai13 = document.getElementById("ai_flag13"); //Message about your friend moving away - Unhappy Branch
	ai14 = document.getElementById("ai_flag14"); //Message about another family visit - Moderate/Happy Branch
	ai15 = document.getElementById("ai_flag15"); //Message about sick day off - Moderate Branch
	ai16 = document.getElementById("ai_flag16"); //Message about second daughter talking - Moderate/Happy Branch
	ai17 = document.getElementById("ai_flag17"); //Message about game of cards - Happy Branch
	ai18 = document.getElementById("ai_flag18"); //Message about James Jr. Birthday - Happy Branch
	ai19 = document.getElementById("ai_flag19"); //Message about Andre's compliment - Happy Branch
	ai20 = document.getElementById("ai_flag20"); //Message about weekend hunting - Happy Branch
	

	//Use this Game Text Test to Troubleshoot AI
	//document.getElementById("gametext").innerHTML="TEST...";
	
	//****************************************************************************************************\\
	//*******************************************NOT MARRIED AI*******************************************\\
	//****************************************************************************************************\\
		if (season.firstChild.nodeValue < 5) {
		/*IF THE PLAYER ISN'T MARRIED*/
		
			if (money.firstChild.nodeValue <= 8 || ai1.firstChild.nodeValue == 1) {
			/*IF THE PLAYER HAS SPENT SOME MONEY*/			
				
				if (season.firstChild.nodeValue != 3) {
				/*IF IT ISN'T FALL OF THE FIRST YEAR*/
					completed_message = false;
		
					//The While loop continues until a usable AI Message is found
					while (completed_message == false) {
					
						temp_message = rand(6);
						//temp_message = 4;
					
						if (temp_message == 1 && musket.firstChild.nodeValue == 0 && ai2.firstChild.nodeValue == 0) {
						/*IF PLAYER DOESN'T OWN A MUSKET*/
							document.getElementById("gametext").innerHTML="A small group of men went hunting in the areas around the fort this season. Unfortunately, without a musket, you weren&#39;t able to join their hunt. Perhaps you&#39;ll have enough credits to afford one next year&#63;";
							ai2.firstChild.nodeValue++;
							completed_message = true;
						}
						if (temp_message == 2 && comforter.firstChild.nodeValue == 0) {
						/*IF PLAYER DOESN'T OWN A TRADE BLANKET*/
							document.getElementById("gametext").innerHTML="The nights at the Village get really cold at times. It would be really nice to stay warm so you don&#39;t keep waking up in the middle of the night.";
							completed_message = true;
						}
						if (temp_message == 3 && book.firstChild.nodeValue == 0) {
						/*IF PLAYER DOESN'T OWN A BOOK*/
							document.getElementById("gametext").innerHTML="At night, it would be nice if you had something to relax with before falling asleep. Perhaps some reading material would make falling asleep easier for you&#63;";
							completed_message = true;
						}
						if (temp_message == 4 && candle.firstChild.nodeValue == 0) {
						/*IF PLAYER DOESN'T OWN A CANDLE*/
							document.getElementById("gametext").innerHTML="When the sun begins to set, there&#39;s no light in your house. You can only see by the light of the moon, if it&#39;s out on any particular night. Wouldn&#39;t it be nice to have a candle and see the inside of your house at night&#63;";
							completed_message = true;
						}
						if (temp_message == 5 && book.firstChild.nodeValue == 1 && candle.firstChild.nodeValue == 0) {
						/*IF PLAYER OWNS A BOOK BUT DOESN'T OWN A CANDLE*/
							document.getElementById("gametext").innerHTML="While having a book certainly gives you something to pass the time with during the day, you simply cannot see the words on the page at night without the light of the moon. Having a candle would allow you to read your book at night.";
							completed_message = true;
						}
						if (temp_message == 6) {
						/*DEFAULT MESSAGE*/
							document.getElementById("gametext").innerHTML="Living in your house at the Village is quite lonely. On your way to work each day, you regularly see women going about their duties. Perhaps you&#39;ll find one that desires companionship as you do.";
							completed_message = true;
						}
						
					
					} //Ends the Conditional While Loop for AI Messages (When Player is Single)

				}
				else {
				/*IF IT'S FALL OF THE FIRST YEAR*/
					document.getElementById("gametext").innerHTML="Have you been keeping track of the seasons at the bottom of the screen&#63; It&#39;s currently Fall, and Winter is just around the corner. If you&#39;re not careful, your living conditions could become very harsh.";
				}
				
			}
			else {
			/*IF THE PLAYER HASN'T SPENT ENOUGH MONEY*/
				document.getElementById("gametext").innerHTML="Your house still looks a little bare. While it&#39;s certainly a good idea to save your credits, you may wish to invest some of your savings in something to help you cook. A trade blanket would keep you warm in the winter, and some silverware would help with the daily mealtime mess.";
				ai1.firstChild.nodeValue++;
			}
		
		
		} //END OF SINGLE BRANCH
		
		
	//****************************************************************************************************\\
	//*********************************************MARRIED AI*********************************************\\
	//****************************************************************************************************\\
		else {
		/*IF THE PLAYER IS MARRIED*/
			
			if (event.firstChild.nodeValue == 1 && yes.firstChild.nodeValue == 1 && ai3.firstChild.nodeValue == 0) {
			/*IF THE PLAYER JUST BURNED HIS HAND IN EVENT 1*/
				document.getElementById("gametext").innerHTML="When your wife saw your burned hand, she became upset. First and foremost, she was worried about you. But she also reminded you that you have a family to take care of, and that you shouldn’t take unnecessary risks.";
				ai3.firstChild.nodeValue++;
			}
			else {
			/*IF THE PLAYER DID NOT JUST BURN HIS HAND IN EVENT 1*/
			
				if (event.firstChild.nodeValue == 2 && yes.firstChild.nodeValue == 1 && ai4.firstChild.nodeValue == 0) {
				/*IF PLAYER JUST BOUGHT A DOLL FOR HIS DAUGHTER IN EVENT 2*/
					document.getElementById("gametext").innerHTML="Typically these days, when you come home from work, you find your daughter playing with her doll. She is very grateful, and thanks you for the doll several times over.";
					ai4.firstChild.nodeValue++;
				}
				else {
				/*IF PLAYER DID NOT JUST BUY A DOLL FOR HIS DAUGHTER IN EVENT 2*/
				
					if (event.firstChild.nodeValue == 6 && no.firstChild.nodeValue == 1 && ai5.firstChild.nodeValue == 0) {
					/*IF PLAYER JUST TURNED DOWN THE JOB IN EVENT 6*/
						document.getElementById("gametext").innerHTML="While your wife understands that you didn&#39;t feel ready to take on the job at the smithy, she is disappointed that you didn&#39;t give it a try. She believes you should be a little more ambitious.";
						ai5.firstChild.nodeValue++;
					}
					else {
					/*IF PLAYER DID NOT JUST TURN DOWN THE JOB IN EVENT 6*/
					
						if (event.firstChild.nodeValue == 7 && ai6.firstChild.nodeValue == 0) {
						/*IF PLAYER JUST EXPERIENCED DAUGHTER SICKNESS IN EVENT 7*/
							document.getElementById("gametext").innerHTML="Though she recovered from her illness, your wife is still worried about your daughter. She hopes that your family doesn&#39;t have to face another stressful event like that.";
							ai6.firstChild.nodeValue++;
						}
						else {
						/*IF PLAYER DID NOT JUST EXPERIENCE DAUGHTER SICKNESS IN EVENT 7*/
						
							if (event.firstChild.nodeValue == 10 && ai7.firstChild.nodeValue == 0) {
							/*IF PLAYER JUST EXPERIENCED DAUGHTER REBELLIOUSNESS IN EVENT 10*/
								document.getElementById("gametext").innerHTML="Your daughter is still at odds with you when you get home in the evenings. You hope that this is just a phase, and that it will pass shortly.";
								ai7.firstChild.nodeValue++;
							}
							else {
							/*IF PLAYER DID NOT JUST EXPERIENCE DAUGHTER REBELLIOUSNESS IN EVENT 10*/
							
								if (event.firstChild.nodeValue == 12 && no.firstChild.nodeValue == 1 && ai8.firstChild.nodeValue == 0) {
								/*IF PLAYER JUST REFUSED TO HELP THE FRIEND IN EVENT 12*/
									document.getElementById("gametext").innerHTML="Even though you turned your friend down to take care of your family, your wife is saddened by your decision. She cares about your friend, too, and she doesn&#39;t think that he will survive without your help.";
									ai8.firstChild.nodeValue++;
								}
								else {
								/*IF PLAYER DID NOT JUST REFUSE TO HELP THE FRIEND IN EVENT 12*/
								
									if (event.firstChild.nodeValue == 14 && ai9.firstChild.nodeValue == 0) {
									/*IF PLAYER JUST EXPERIENCED FRIEND DEATH IN EVENT 14*/
										document.getElementById("gametext").innerHTML="Your family feels your depression, and is saddened by the death as well. They try their best to help you through the hard nights.";
										ai9.firstChild.nodeValue++;
									}
									else {
									/*IF PLAYER DID NOT JUST EXPERIENCE FRIEND DEATH IN EVENT 14*/
									
										if (event.firstChild.nodeValue == 19 && no.firstChild.nodeValue == 1 && ai10.firstChild.nodeValue == 0) {
										/*IF PLAYER JUST BROKE A TOOL IN EVENT 19*/
											document.getElementById("gametext").innerHTML="With your pay reduced for the year, your wife is disappointed by your recklessness at the smithy. Her lecture causes an argument, and some tension has been created between the two of you.";
											ai10.firstChild.nodeValue++;
										}
										else {
										/*IF PLAYER DID NOT JUST BREAK A TOOL IN EVENT 19*/
										
											if (event.firstChild.nodeValue == 21 && yes.firstChild.nodeValue == 1 && ai11.firstChild.nodeValue == 0) {
											/*IF PLAYER JUST REPAIRED THE SHIP IN EVENT 21*/
												document.getElementById("gametext").innerHTML="Your wife is very proud of you for helping with the ship&#39;s repairs. Though times are tough, and the extra job took its toll on your body, you really pulled through for your family.";
												ai11.firstChild.nodeValue++;
											}
											else {
											/*IF PLAYER DID NOT JUST REPAIR THE SHIP IN EVENT 21*/
											
												if (event.firstChild.nodeValue == 22 && yes.firstChild.nodeValue == 1 && ai12.firstChild.nodeValue == 0) {
												/*IF PLAYER JUST TRADED CAST IRON POT IN EVENT 22*/
													document.getElementById("gametext").innerHTML="Without a cast iron pot for your wife to cook with, her ability to cook meals is greatly diminished. She is very unhappy with your choice.";
													ai12.firstChild.nodeValue++;
												}
												else {
												/*IF PLAYER DID NOT JUST TRADE CAST IRON POT IN EVENT 22*/

												
												
												//BEGIN RANDOMIZED MESSAGES FOR UNHAPPY FAMILY
												if (happiness.firstChild.nodeValue < 0) {
													completed_message = false;
										
													//The While loop continues until a usable AI Message is found
													while (completed_message == false) {
													
														temp_message = rand(15);
														//temp_message = 1;
													
														if (temp_message == 1 && book.firstChild.nodeValue == 0) {
														/*YOUR DAUGHTER WANTS A BOOK*/
															document.getElementById("gametext").innerHTML="Your first daughter is very interested in learning how to read, but there just isn&#39;t enough reading material around the house. Perhaps you should purchase a book from the company store.";
															completed_message = true;
														}
														if (temp_message == 2 && season.firstChild.nodeValue > 14) {
														/*SON HAS BEEN KEEPING WIFE UP*/
															document.getElementById("gametext").innerHTML="Lately, James Jr. has been crying in the middle of the night. The wails keep the rest of your family up, and the added stress on your wife is causing her to become irritable.";
															completed_message = true;
														}
														if (temp_message == 3 && season.firstChild.nodeValue > 18) {
														/*DAUGHTERS HAVE BEEN FIGHTING*/
															document.getElementById("gametext").innerHTML="Your second daughter may be old enough to talk and walk, but she has been fighting with your firstborn. If you pay more attention to your family, the fighting should stop eventually.";
															completed_message = true;
														}
														if (temp_message == 4 && pot.firstChild.nodeValue == 0) {
														/*WIFE WANTS A POT TO COOK IN*/
															document.getElementById("gametext").innerHTML="Without a cast iron pot to cook in, your wife feels that her options for dinner are rather limited. She cannot create the dinners she wants to, and the redundant meals certainly don&#39;t help anyone&#39;s health.";
															completed_message = true;
														}
														if (temp_message == 5 && comforter.firstChild.nodeValue == 0) {
														/*WIFE WANTS A COMFORTER*/
															document.getElementById("gametext").innerHTML="Your wife is worried about the winter nights. While the Village hasn&#39;t recently encountered a storm, all it would take is a few weeks of truly frigid air to harm your family. Maybe you should buy a comforter to keep your family warm during the winter.";
															completed_message = true;
														}
														if (temp_message == 6) {
														/*WIFE IS WORRIED THAT YOU CAN'T PROVIDE*/
															document.getElementById("gametext").innerHTML="Things are less than satisfactory in your home, and your wife is worried about your ability to take care of your family. Spend some time paying attention to their needs, and her worries should subside.";
															completed_message = true;
														}
														if (temp_message == 7 && spode.firstChild.nodeValue == 0) {
														/*WIFE WANTS SPODE*/
															document.getElementById("gametext").innerHTML="In the Village, your wife feels that your family has a low social standing. You can feel the lack of respect from fellow workers, too. If you had some spode, your family would receive a bit of admiration.";
															completed_message = true;
														}
														if (temp_message == 8 && money.firstChild.nodeValue < 6) {
														/*MONEY IS LOW AND YOUR WIFE IS WORRIED*/
															document.getElementById("gametext").innerHTML="Credits are hard to come by, and it&#39;s hard to save for those rainy days. But the small amount of credits you have saved makes your wife nervous. Even a few extra credits would put her fears to rest.";
															completed_message = true;
														}
														if (temp_message == 9) {
														/*PLAYER HAS BEEN GETTING SICK*/
															document.getElementById("gametext").innerHTML="While you&#39;re unsure why, you&#39;ve been getting sick a lot recently. Thankfully, none of the illnesses have been dangerous, but you should still look out for yourself.";
															completed_message = true;
														}
														if (temp_message == 10) {
														/*FIRST DAUGHTER DOESN'T LIKE SPENDING TIME WITH PLAYER*/
															document.getElementById("gametext").innerHTML="Your firstborn daughter doesn&#39;t enjoy spending time with you. She has a much stronger bond with your wife, and sometimes talks about her first dad. If you spend some time taking care of your family, she should begin to think of you as her only father.";
															completed_message = true;
														}
														if (temp_message == 11 && ai13.firstChild.nodeValue == 0) {
														/*PLAYER'S FRIEND JUST MOVED AWAY*/
															document.getElementById("gametext").innerHTML="Sadly, one of your good friends from the village just moved away. His father died recently, and he decided to move his family closer to his mother in order to take care of her. You understand, of course, but you still must learn to live without another friend.";
															ai13.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 12 && candle.firstChild.nodeValue == 0) {
														/*WIFE WANTS A CANDLE*/
															document.getElementById("gametext").innerHTML="Nights without good moonlight are pitch black inside of your house. Your wife would like to be able to see whenever she needs to take care of the children, and begs you to buy a candle.";
															completed_message = true;
														}
														if (temp_message == 13 && musket.firstChild.nodeValue == 0) {
														/*WIFE WANTS A MUSKET*/
															document.getElementById("gametext").innerHTML="Men from the Village tend to hunt small game from time to time. Your wife has asked you several times to buy a musket so you can provide some extra meat for dinner.";
															completed_message = true;
														}
														if (temp_message == 14 && silverware.firstChild.nodeValue == 0) {
														/*WIFE WANTS SILVERWARE*/
															document.getElementById("gametext").innerHTML="Your wife is tired of not having any silverware to eat with. She has stated numerous times that your family is not made up of animals, and that you should quickly rectify this problem.";
															completed_message = true;
														}
														if (temp_message == 15) {
														/*DEFAULT UNHAPPY MESSAGE*/
															document.getElementById("gametext").innerHTML="Every day when you come home from work, you find that your family is unhappy. You are stressed from your job at the smithy, of course, but maybe you could try listening to their needs&#63;";
															completed_message = true;
														}
														
														
													
													} //Ends the Conditional While Loop for AI Messages (When Player is Married with Unhappy Family)
												
												}
												
												//BEGIN RANDOMIZED MESSAGES FOR INDIFFERENT FAMILY
												if (happiness.firstChild.nodeValue == 0 || happiness.firstChild.nodeValue == 1 || happiness.firstChild.nodeValue == 2  || happiness.firstChild.nodeValue == 3 || happiness.firstChild.nodeValue == 4 || happiness.firstChild.nodeValue == 5) {
													completed_message = false;
										
													//The While loop continues until a usable AI Message is found
													while (completed_message == false) {
													
														temp_message = rand(10);
														//temp_message = 4;
													
														if (temp_message == 1 && money.firstChild.nodeValue < 6) {
														/*WIFE WORRIED ABOUT MONEY - MODERATE*/
															document.getElementById("gametext").innerHTML="The amount of credits you have saved away worries your wife, but it isn&#39;t troubling her too much. You&#39;ve shown that you can take care of your family, so she trusts your judgment.";
															completed_message = true;
														}
														if (temp_message == 2 && comforter.firstChild.nodeValue == 0) {
														/*WIFE WANTS A COMFORTER*/
															document.getElementById("gametext").innerHTML="Your wife is worried about the winter nights. While the Village hasn&#39;t recently encountered a storm, all it would take is a few weeks of truly frigid air to harm your family. Maybe you should buy a comforter to keep your family warm during the winter.";
															completed_message = true;
														}
														if (temp_message == 3 && musket.firstChild.nodeValue == 0) {
														/*WIFE WANTS A MUSKET*/
															document.getElementById("gametext").innerHTML="Men from the Village tend to hunt small game from time to time. Your wife has asked you several times to buy a musket so you can provide some extra meat for dinner.";
															completed_message = true;
														}
														if (temp_message == 4 && ai14.firstChild.nodeValue == 0) {
														/*ANOTHER FAMILY VISIT*/
															document.getElementById("gametext").innerHTML="The other day, you spent some time with another family in the Village. You traded stories, shared many laughs, and made great friends. The visit left your family in high spirits for several weeks.";
															ai14.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 5 && silverware.firstChild.nodeValue == 0) {
														/*WIFE WANTS SILVERWARE*/
															document.getElementById("gametext").innerHTML="Your wife is tired of not having any silverware to eat with. She has stated numerous times that your family is not made up of animals, and that you should quickly rectify this problem.";
															completed_message = true;
														}
														if (temp_message == 6 && season.firstChild.nodeValue > 14) {
														/*SON HAS BEEN KEEPING WIFE UP*/
															document.getElementById("gametext").innerHTML="Lately, James Jr. has been crying in the middle of the night. The wails keep the rest of your family up, and the added stress on your wife is causing her to become irritable.";
															completed_message = true;
														}
														if (temp_message == 7 && ai15.firstChild.nodeValue == 0) {
														/*SICK DAY OFF*/
															document.getElementById("gametext").innerHTML="Andr&eacute noticed that you were really sick, and gave you the day off as a reward for all of your hard work recently. Thankful for his kindness, you spent the day at home with your family.";
															ai15.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 8 && candle.firstChild.nodeValue == 0) {
														/*WIFE WANTS A CANDLE*/
															document.getElementById("gametext").innerHTML="Nights without good moonlight are pitch black inside of your house. Your wife would like to be able to see whenever she needs to take care of the children, and begs you to buy a candle.";
															completed_message = true;
														}
														if (temp_message == 9 && season.firstChild.nodeValue > 16 && ai16.firstChild.nodeValue == 0) {
														/*SECOND DAUGHTER STARTED TO TALK*/
															document.getElementById("gametext").innerHTML="Your second daughter has started to talk within the past season or two, and your family is overjoyed at her progress. She just said her first full sentence while you were at work recently.";
															ai16.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 10) {
														/*DEFAULT MODERATE*/
															document.getElementById("gametext").innerHTML="There are plenty of things that your family wishes were different, but you&#39;re a good father, and so they try not to complain. They are content in the house that you have provided for them.";
															completed_message = true;
														}
														
														
													
													} //Ends the Conditional While Loop for AI Messages (When Player is Married with Moderate Family)
												
												}
												
												//BEGIN RANDOMIZED MESSAGES FOR HAPPY FAMILY
												if (happiness.firstChild.nodeValue > 5) {
													completed_message = false;
										
													//The While loop continues until a usable AI Message is found
													while (completed_message == false) {
													
														temp_message = rand(10);
														//temp_message = 4;
													
														if (temp_message == 1) {
														/*WIFE IS PROUD OF YOU*/
															document.getElementById("gametext").innerHTML="All of the hard work you put in at the smithy has not gone unnoticed by your wife. She is extremely grateful for what you do for the family, and regularly does her best to make you comfortable when you get home from work.";
															completed_message = true;
														}
														if (temp_message == 2) {
														/*SPENDING TIME WITH DAUGHTER*/
															document.getElementById("gametext").innerHTML="On your few days off of work, you&#39;ve spent some time with your first daughter. She can be rambunctious at times, yes, but the bond you&#39;ve formed with her recently is rather strong. She is happy to call you her father.";
															completed_message = true;
														}
														if (temp_message == 3 && season.firstChild.nodeValue > 18 && ai16.firstChild.nodeValue == 0) {
														/*SECOND DAUGHTER STARTED TO TALK*/
															document.getElementById("gametext").innerHTML="Your second daughter has started to talk within the past season or two, and your family is overjoyed at her progress. She just said her first full sentence while you were at work recently.";
															ai16.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 4 && ai17.firstChild.nodeValue == 0) {
														/*GAME OF CARDS*/
															document.getElementById("gametext").innerHTML="Several men from the smithy are getting together soon to play a game of cards. You&#39;ve become good friends with them in the past few seasons, and they invite you over for the game. Your wife is happy to take care of the kids for a night.";
															ai17.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 5 && season.firstChild.nodeValue > 14 && ai18.firstChild.nodeValue == 0) {
														/*JAMES JR. BIRTHDAY*/
															document.getElementById("gametext").innerHTML="Last week, James Jr. had his birthday. He is growing stronger with each passing season, and he should start talking anytime. Holding him is one of your greatest joys after working at the smithy all day.";
															ai18.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 6 && candle.firstChild.nodeValue == 0) {
														/*WIFE WANTS A CANDLE*/
															document.getElementById("gametext").innerHTML="Nights without good moonlight are pitch black inside of your house. Your wife would like to be able to see whenever she needs to take care of the children, and begs you to buy a candle.";
															completed_message = true;
														}
														if (temp_message == 7 && ai14.firstChild.nodeValue == 0) {
														/*ANOTHER FAMILY VISIT*/
															document.getElementById("gametext").innerHTML="The other day, you spent some time with another family in the Village. You traded stories, shared many laughs, and made great friends. The visit left your family in high spirits for several weeks.";
															ai14.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 8 && ai19.firstChild.nodeValue == 0) {
														/*ANDRE COMPLIMENT*/
															document.getElementById("gametext").innerHTML="Today, Andr&eacute complimented you at work. He remarked that you&#39;ve been taking great care of your family, and that he respects a man who does so. The respect and admiration you received sent you home in a good mood.";
															ai19.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 9 && ai20.firstChild.nodeValue == 0) {
														/*WEEKEND OF HUNTING*/
															document.getElementById("gametext").innerHTML="You returned home from a weekend of hunting with some other men of the Village. Your spoils impressed your wife, and she cooked a grand feast for you and the rest of the family. Times are certainly good.";
															ai20.firstChild.nodeValue++;
															completed_message = true;
														}
														if (temp_message == 10) {
														/*DEFAULT HAPPY*/
															document.getElementById("gametext").innerHTML="Your family is very happy. You&#39;re doing a great job taking care of them, and your wife is very optimistic about the future. Keep this up, and your family will continue to thrive and live happily.";
															completed_message = true;
														}
														
														
													
													} //Ends the Conditional While Loop for AI Messages (When Player is Married with Happy Family)
												
												}
												
												
						
												
												

												}
											
											
											}
										
										
										}
									
									
									}
								
								
								}
							
							
							}
						
						
						}
					
					
					}
				
				
				}
			
			
			}

			
		} //END OF MARRIED BRANCH
		
		

}


//----------------------------
//Function for Displaying Season Images
//----------------------------
function DisplaySeasons() {
	//Target the current_season div to determine which season
	season = document.getElementById("current_season");
	
	//Spring
	if (season.firstChild.nodeValue == 1 || season.firstChild.nodeValue == 5 || season.firstChild.nodeValue == 9 || season.firstChild.nodeValue == 13 || season.firstChild.nodeValue == 17 || season.firstChild.nodeValue == 21 || season.firstChild.nodeValue == 25) {
		document.getElementById("winter_icon").src = "images/game_variable_images/blank.png";
		document.getElementById("spring_icon").src = "images/game_variable_images/spring.png";
	}
	
	//Summer
	if (season.firstChild.nodeValue == 2 || season.firstChild.nodeValue == 6 || season.firstChild.nodeValue == 10 || season.firstChild.nodeValue == 14 || season.firstChild.nodeValue == 18 || season.firstChild.nodeValue == 22) {
		document.getElementById("spring_icon").src = "images/game_variable_images/blank.png";
		document.getElementById("summer_icon").src = "images/game_variable_images/summer.png";
	}
	
	//Fall
	if (season.firstChild.nodeValue == 3 || season.firstChild.nodeValue == 7 || season.firstChild.nodeValue == 11 || season.firstChild.nodeValue == 15 || season.firstChild.nodeValue == 19 || season.firstChild.nodeValue == 23) {
		document.getElementById("summer_icon").src = "images/game_variable_images/blank.png";
		document.getElementById("fall_icon").src = "images/game_variable_images/fall.png";
	}

	//Winter
	if (season.firstChild.nodeValue == 4 || season.firstChild.nodeValue == 8 || season.firstChild.nodeValue == 12 || season.firstChild.nodeValue == 16 || season.firstChild.nodeValue == 20 || season.firstChild.nodeValue == 24) {
		document.getElementById("fall_icon").src = "images/game_variable_images/blank.png";
		document.getElementById("winter_icon").src = "images/game_variable_images/winter.png";
	}


}


//----------------------------
//Function for Displaying Game Variables
//----------------------------
function DisplayVariables() {
	//Target "money" div, retrieve value, and store in "money" variable
	money = document.getElementById("money");
	
	//Target "score" div, retrieve value, and store in "score" variable
	score = document.getElementById("total_score");
	
	//Show money and score icons
	document.getElementById("money_icon").style.visibility = "visible";
	document.getElementById("score_icon").style.visibility = "visible";

	
	//Displays the money and score variables in their appropriate paragraphs
	document.getElementById("money_display_text").innerHTML="Credit: " + money.firstChild.nodeValue;
	document.getElementById("score_display_text").innerHTML="Score: " + score.firstChild.nodeValue;

}


//----------------------------
//End of Game Function
//----------------------------
function endGame () {
	//Hides bought items on the end screen
	HideItems();

	//Change background to house of player
	document.getElementById("game_background").src = "images/640x960/backgrounds/end_screen_temp.jpg";
	
	//Gets information for family happiness
	happiness = document.getElementById("family_happiness");
	
	//Happy Ending Text
	if (happiness.firstChild.nodeValue < 0) {
		document.getElementById("gametext").innerHTML="You and your family are still alive, but things are still rough. You&#39;re a blacksmith now, and you can better tend to their needs. During the long road to becoming a blacksmith, however, you neglected them and made poor choices. Maybe life will be better from here on out&#63;";
	}
	//Moderate Ending Text
	if (happiness.firstChild.nodeValue == 0 || happiness.firstChild.nodeValue == 1 || happiness.firstChild.nodeValue == 2  || happiness.firstChild.nodeValue == 3 || happiness.firstChild.nodeValue == 4 || happiness.firstChild.nodeValue == 5) {
		document.getElementById("gametext").innerHTML="It was a rough four years at the fort, but you managed to take care of you family. Even though you&#39;re now a true blacksmith, things are still going to be hard. But rest easy knowing that you took care of yourself and your family. Good job.";
	}
	//Unhappy Ending Text
	if (happiness.firstChild.nodeValue > 5) {
		document.getElementById("gametext").innerHTML="The nights were long, and the days were hard, but you managed to take good care of your family. You&#39;re now a true blacksmith, and your family couldn&#39;t be more proud. Your children are happy to see you come home, and your wife is proud of you. Great job!";
	}
	
	//Remove all buttons
	document.getElementById("work_button").style.display = "none";
	document.getElementById("home_button").style.display = "none";
	document.getElementById("yes_button").style.display = "none";
	document.getElementById("no_button").style.display = "none";
	document.getElementById("purchase_button").style.display = "none";
	
}


//----------------------------
//Purchase Functions - Used when the player buys that item from the catalogue
//----------------------------
function purchase_book() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-book");
	money = document.getElementById("money");

	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 6) {
			//Subtract money, add score, change catalogue text, alter ladle div
			item.firstChild.nodeValue++;
			document.getElementById("p-book1").firstChild.nodeValue="Purchased";
			document.getElementById("p-book1").style.color="gray";
			document.getElementById("p-book2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = Number(money.firstChild.nodeValue) - 6;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 60;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_candlestick() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-candlestick");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 2) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 2;
			item.firstChild.nodeValue++;
			document.getElementById("p-candle1").firstChild.nodeValue="Purchased";
			document.getElementById("p-candle1").style.color="gray";
			document.getElementById("p-candle2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 20;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_pot() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-cast_iron_pot");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 6) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 6;
			item.firstChild.nodeValue++;
			document.getElementById("p-pot1").firstChild.nodeValue="Purchased";
			document.getElementById("p-pot1").style.color="gray";
			document.getElementById("p-pot2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 60;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_chair() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-chair");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 17) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 17;
			item.firstChild.nodeValue++;
			document.getElementById("p-chair1").firstChild.nodeValue="Purchased";
			document.getElementById("p-chair1").style.color="gray";
			document.getElementById("p-chair2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 170;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_comforter() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-comforter");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 10) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 10;
			item.firstChild.nodeValue++;
			document.getElementById("p-comforter1").firstChild.nodeValue="Purchased";
			document.getElementById("p-comforter1").style.color="gray";
			document.getElementById("p-comforter2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 100;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_kettle() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-copper_kettle");
	shelf = document.getElementById("i-wall_shelf");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 2) {
		
			//Check to see if the player has bought the shelf. If not, deny their purchase.
			if (shelf.firstChild.nodeValue == 1) {
				//Subtract money, change catalogue text, alter ladle div
				temp_money = temp_money - 2;
				item.firstChild.nodeValue++;
				document.getElementById("p-kettle1").firstChild.nodeValue="Purchased";
				document.getElementById("p-kettle1").style.color="gray";
				document.getElementById("p-kettle2").firstChild.nodeValue="";
				
				//Assign new money total to money div
				money.firstChild.nodeValue = temp_money;
				
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 20;
			}
			else {
				document.getElementById("gametext").innerHTML="The kettle needs to be stored on the wall shelf. Why don't you buy that first&#63;";
			}
			
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_jug() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-jug");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 3) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 3;
			item.firstChild.nodeValue++;
			document.getElementById("p-jug1").firstChild.nodeValue="Purchased";
			document.getElementById("p-jug1").style.color="gray";
			document.getElementById("p-jug2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 30;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_ladle() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-ladle");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 1) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 1;
			item.firstChild.nodeValue++;
			document.getElementById("p-ladle1").firstChild.nodeValue="Purchased";
			document.getElementById("p-ladle1").style.color="gray";
			document.getElementById("p-ladle2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_musket() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-musket");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 22) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 22;
			item.firstChild.nodeValue++;
			document.getElementById("p-musket1").firstChild.nodeValue="Purchased";
			document.getElementById("p-musket1").style.color="gray";
			document.getElementById("p-musket2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 220;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_horn() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-powder_horn");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 5) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 5;
			item.firstChild.nodeValue++;
			document.getElementById("p-horn1").firstChild.nodeValue="Purchased";
			document.getElementById("p-horn1").style.color="gray";
			document.getElementById("p-horn2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 50;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_silverware() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-silverware");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 9) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 9;
			item.firstChild.nodeValue++;
			document.getElementById("p-silverware1").firstChild.nodeValue="Purchased";
			document.getElementById("p-silverware1").style.color="gray";
			document.getElementById("p-silverware2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 90;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 1;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_china() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-spode_china_set");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 100) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 100;
			item.firstChild.nodeValue++;
			document.getElementById("p-china1").firstChild.nodeValue="Purchased";
			document.getElementById("p-china1").style.color="gray";
			document.getElementById("p-china2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 600;
			
			//Alters the Family's Happiness
			happy = document.getElementById("family_happiness");
			happy.firstChild.nodeValue = Number(happy.firstChild.nodeValue) + 5;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_stool() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-stool");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 15) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 15;
			item.firstChild.nodeValue++;
			document.getElementById("p-stool1").firstChild.nodeValue="Purchased";
			document.getElementById("p-stool1").style.color="gray";
			document.getElementById("p-stool2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;

			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 150;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_bottles() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-storage_bottles");
	shelf = document.getElementById("i-wall_shelf");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 7) {
			
			//Check to see if the player has bought the shelf. If not, deny their purchase.
			if (shelf.firstChild.nodeValue == 1) {
				//Subtract money, change catalogue text, alter ladle div
				temp_money = temp_money - 7;
				item.firstChild.nodeValue++;
				document.getElementById("p-bottles1").firstChild.nodeValue="Purchased";
				document.getElementById("p-bottles1").style.color="gray";
				document.getElementById("p-bottles2").firstChild.nodeValue="";
				
				//Assign new money total to money div
				money.firstChild.nodeValue = temp_money;
				
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 70;
			}
			else {
				document.getElementById("gametext").innerHTML="The storage bottles need to be stored on the wall shelf. Why don't you buy that first&#63;";
			}
			
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_chest() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-storage_chest");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 50) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 50;
			item.firstChild.nodeValue++;
			document.getElementById("p-chest1").firstChild.nodeValue="Purchased";
			document.getElementById("p-chest1").style.color="gray";
			document.getElementById("p-chest2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 500;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_tumbler() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-tin_tumbler");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 5) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 5;
			item.firstChild.nodeValue++;
			document.getElementById("p-tumbler1").firstChild.nodeValue="Purchased";
			document.getElementById("p-tumbler1").style.color="gray";
			document.getElementById("p-tumbler2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 50;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_shelf() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-wall_shelf");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 11) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 11;
			item.firstChild.nodeValue++;
			document.getElementById("p-shelf1").firstChild.nodeValue="Purchased";
			document.getElementById("p-shelf1").style.color="gray";
			document.getElementById("p-shelf2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 110;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}

function purchase_basin() {
	//Assigns temporary variables for player's money and purchase div
	item = document.getElementById("i-wash_basin");
	money = document.getElementById("money");
	temp_money = money.firstChild.nodeValue;
	
	//Checks to see if the item has been bought
	if (item.firstChild.nodeValue == 0) {
		
		//Checks to see if player has enough money to buy the item
		if (money.firstChild.nodeValue >= 1) {
			//Subtract money, change catalogue text, alter ladle div
			temp_money = temp_money - 1;
			item.firstChild.nodeValue++;
			document.getElementById("p-basin1").firstChild.nodeValue="Purchased";
			document.getElementById("p-basin1").style.color="gray";
			document.getElementById("p-basin2").firstChild.nodeValue="";
			
			//Assign new money total to money div
			money.firstChild.nodeValue = temp_money;
			
			//Adds to the player's score for buying the item
			score = document.getElementById("total_score");
			score.firstChild.nodeValue = Number(score.firstChild.nodeValue) + 10;
		}
		else {
			document.getElementById("gametext").innerHTML="You don't have enough credits to purchase that!";
		}
		
		
	}
	
	//Update Game Variable Displays
	DisplayVariables();
	
}
