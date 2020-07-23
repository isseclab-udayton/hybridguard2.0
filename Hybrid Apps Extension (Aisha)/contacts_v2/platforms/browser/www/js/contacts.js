document.addEventListener("deviceready", onDeviceReady14, false);
function onDeviceReady14()
{
	document.getElementById("showcontacts").addEventListener("click", createContact);
	function createContact()
	{
		var myContact = navigator.contacts.create({"displayName": "Test User"});
    alert("test 123"+myContact.toString())
	}

  function error()
{
  alert("cannot create contacts");

}
}


/*document.addEventListener('deviceready', onDeviceReady1, false);

function onDeviceReady1()
{

  document.getElementById("showcontacts").addEventListener("click", createContact);
  function createContact(){
  var myContact1 = navigator.contacts.create({"displayName": "Red   "});
  var myContact2 = navigator.contacts.create({"displayName": "Green  "});
  var myContact3 = navigator.contacts.create({"displayName": "Stephan   "});
  var myContact4 = navigator.contacts.create({"displayName": "Thomas"});
  var disp=myContact1.displayName+myContact2.displayName+myContact3.displayName+myContact4.displayName;

  alert(JSON.stringify(disp));

}

}
*/
